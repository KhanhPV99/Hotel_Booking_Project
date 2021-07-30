/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.controller;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.BookingDetailEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.BookingEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.CreditCardEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.PaymentEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.PromotionEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.RoomEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.ServiceBookingEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.ServiceEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.enums.BookingStatus;
import com.huyapp.jv42_nguyenngochuy_final_project.enums.Gender;
import com.huyapp.jv42_nguyenngochuy_final_project.service.BookingDetailService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.BookingService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.CreditCardService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.ImageService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.PaymentService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.PromotionService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.RoomService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.RoomTypeService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.ServiceBookingService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.ServiceService;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

/**
 *
 * @author LOVE
 */
@Controller
public class UserController {

    @Autowired
    private RoomTypeService roomTypeService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private PromotionService promotionService;

    @Autowired
    private ServiceService serviceService;

    @Autowired
    private ServiceBookingService serviceBookingService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private BookingDetailService bookingDetailService;

    @Autowired
    private CreditCardService creditCardService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private JavaMailSender emailSender;

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @RequestMapping(value = {"/about-us"}, method = RequestMethod.GET)
    public String aboutUsPage() {

        return "/user/about-us-page";
    }

    @RequestMapping(value = {"/rooms"}, method = RequestMethod.GET)
    public String RoomsPage(Model model) {

        model.addAttribute("roomTypes", roomTypeService.getRoomTypes());
        return "/user/rooms-page";
    }

    @RequestMapping(value = {"/promotion"}, method = RequestMethod.GET)
    public String PromotionPage(Model model) {

        LocalDate localDate = LocalDate.now();
        model.addAttribute("promotion", promotionService.getPromotionValid(LocalDate.now()));

        return "/user/promotion-page";
    }

//    @RequestMapping(value = {"/news"}, method = RequestMethod.GET)
//    public String NewsPage() {
//
//        return "/user/news-page";
//    }
    @RequestMapping(value = {"/contact"}, method = RequestMethod.GET)
    public String ContactPage() {

        return "/user/contact-page";
    }

    @RequestMapping(value = {"/room/{roomTypeId}"}, method = RequestMethod.GET)
    public String RoomTypePage(Model model,
            @PathVariable("roomTypeId") int roomTypeId) {

        model.addAttribute("convenients", roomTypeService.getRoomTypeConvenientById(roomTypeId));
//        model.addAttribute("roomTypes", roomTypeService.getRoomTypeImageById(roomTypeId));
        model.addAttribute("roomTypes", roomTypeService.findById(roomTypeId));
        model.addAttribute("images", imageService.getImageRoomType(roomTypeId));

        return "/user/room-type-page";
    }

    @RequestMapping(value = {"/search/{roomTypeId}"}, method = RequestMethod.GET)
    public String SearchDatePage(Model model,
            @PathVariable("roomTypeId") int roomTypeId) {

        model.addAttribute("roomType", roomTypeService.findById(roomTypeId));
        model.addAttribute("roomTypes", roomTypeService.getRoomTypes());
        model.addAttribute("roomTypeId", roomTypeId);

        return "/user/search-page";
    }

    @RequestMapping(value = {"/search-room"}, method = RequestMethod.POST)
    public String SearchRoomPage(Model model,
            @RequestParam(name = "check_in", required = false) String check_in,
            @RequestParam(name = "check_out", required = false) String check_out,
            @RequestParam(name = "roomTypeId", required = false) int roomTypeId,
            HttpSession session) {

        if (check_in.isEmpty() || check_out.isEmpty()) {
            model.addAttribute("message", "Please enter check-in date and check-out date !");
            return "/home";
        } else {
//            convert String to Date
            LocalDate dateCheckIn = LocalDate.now();
            LocalDate dateCheckOut = LocalDate.now();
            long nights = 0;
            try {
                DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                dateCheckIn = LocalDate.parse(check_in, dateTimeFormatter);
                dateCheckOut = LocalDate.parse(check_out, dateTimeFormatter);
                nights = dateCheckOut.compareTo(dateCheckIn);
                if (nights == 0) {
                    nights = 1;
                }
            } catch (Exception e) {
            }

//          get discount
            List<PromotionEntity> promotion = promotionService.getPromotionByRoomTypeId(roomTypeId, LocalDate.now());
            double discount = 0;
            if (promotion == null && promotion.size() <= 0) {
//                model.addAttribute("discount", discount);
                model.addAttribute("message", "There are no promotions for the date you selected !");
            } else {
                for (PromotionEntity p : promotion) {
                    discount = p.getDiscount();
                }
//                model.addAttribute("discount", discount);
            }
            session.setAttribute("nights", nights);
            session.setAttribute("discount", discount);
            session.setAttribute("check_in", check_in);
            session.setAttribute("check_out", check_out);
            session.setAttribute("roomType", roomTypeService.findById(roomTypeId));
            model.addAttribute("roomType", roomTypeService.findById(roomTypeId));
//            model.addAttribute("dateCheckIn", dateCheckIn);
//            model.addAttribute("dateCheckOut", dateCheckOut);
            model.addAttribute("RoomSearch", roomService.getRoomSearch(dateCheckIn, dateCheckOut, roomTypeId));
            model.addAttribute("roomTypes", roomTypeService.getRoomTypes());

            return "/user/search-room-page";
        }

    }

    @RequestMapping(value = {"/booking/{room_id}"}, method = RequestMethod.GET)
    public String bookingPage(Model model,
            HttpSession session,
            @PathVariable(name = "room_id", required = false) int room_id) {

        BookingEntity booking = (BookingEntity) session.getAttribute("booking");
        if (booking != null) {
//            co booking
            List<BookingDetailEntity> bookingDetail = booking.getBookingDetails();
            if (bookingDetail != null && bookingDetail.size() > 0) {
//                co room
                boolean isExist = false;
                for (BookingDetailEntity bd : bookingDetail) {
                    if (bd.getRoom() != null && bd.getRoom().getId() == room_id) {
                        isExist = true;
                        break;
                    }
                }
                if (!isExist) {
                    RoomEntity room = roomService.findById(room_id);
                    BookingDetailEntity bd = new BookingDetailEntity();
//                    set data cho bookingDetail
                    bd.setBooking(booking);
                    bd.setPrice(room.getPrice());
                    bd.setRoom(room);
                    bd.setDiscount((double) session.getAttribute("discount"));
                    bd.setUnitPrice(room.getPrice() * (100 - (double) session.getAttribute("discount")) / 100 * (long) session.getAttribute("nights"));

                    bookingDetail.add(bd);
                }
            } else {
//                co booking nhung User da xoa het bookingDetail (k co room)
                RoomEntity room = roomService.findById(room_id);
                bookingDetail = new ArrayList<>();
                BookingDetailEntity bd = new BookingDetailEntity();

                bd.setBooking(booking);
                bd.setPrice(room.getPrice());
                bd.setRoom(room);
                bd.setDiscount((double) session.getAttribute("discount"));
                bd.setUnitPrice(room.getPrice() * (100 - (double) session.getAttribute("discount")) / 100 * (long) session.getAttribute("nights"));

                bookingDetail.add(bd);
            }

            booking.setBookingDetails(bookingDetail);
        } else {
//            khong co booking - new booking
            booking = new BookingEntity();
            booking.setBookingDate(LocalDate.now());
            RoomEntity room = roomService.findById(room_id);
            List<BookingDetailEntity> bookingDetail = new ArrayList<>();
            BookingDetailEntity bd = new BookingDetailEntity();

            bd.setBooking(booking);
            bd.setPrice(room.getPrice());
            bd.setRoom(room);
            bd.setDiscount((double) session.getAttribute("discount"));
            bd.setUnitPrice(room.getPrice() * (100 - (double) session.getAttribute("discount")) / 100 * (long) session.getAttribute("nights"));

            bookingDetail.add(bd);

            booking.setCheckinDate(LocalDate.MIN);
            booking.setBookingDetails(bookingDetail);
        }
        LocalDate dateCheckIn = LocalDate.now();
        LocalDate dateCheckOut = LocalDate.now();
        try {
            DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            dateCheckIn = LocalDate.parse((String) session.getAttribute("check_in"), dateTimeFormatter);
            dateCheckOut = LocalDate.parse((String) session.getAttribute("check_out"), dateTimeFormatter);
            booking.setCheckinDate(dateCheckIn);
            booking.setCheckoutDate(dateCheckOut);
        } catch (Exception e) {
        }
        session.getAttribute("check_in");
        session.getAttribute("check_out");
        session.getAttribute("roomType");
        session.getAttribute("nights");
        session.setAttribute("booking", booking);

        return "redirect:/view-booking";
    }

    @RequestMapping(value = {"/view-booking"})
    public String viewBookingPage(Model model,
            HttpSession session) {
        if (session.getAttribute("roomId") != null) {
            session.removeAttribute("roomId");
            session.removeAttribute("serviceBooking");
        }
        BookingEntity booking = (BookingEntity) session.getAttribute("booking");
        double totalPrice = 0;
        if (booking != null && booking.getBookingDetails() != null && booking.getBookingDetails().size() > 0) {
            for (BookingDetailEntity bd : booking.getBookingDetails()) {
                double totalPriceService = 0;
                List<ServiceBookingEntity> services = bd.getServiceBookings();
                if (services != null && services.size() > 0) {
                    for (ServiceBookingEntity sv : services) {
                        totalPriceService = totalPriceService + sv.getPrice();
                    }
                    //totalPriceService = totalPriceService + bd.getUnitPrice();
//                    bd.setUnitPrice(totalPriceService);
                }
                double totalRoomPrice = bd.getRoom().getPrice() * (100 - (double) session.getAttribute("discount")) / 100 * (long) session.getAttribute("nights");
                bd.setUnitPrice(totalRoomPrice + totalPriceService);
                totalPrice = totalPrice + bd.getUnitPrice();
            }
        }
        booking.setBookingNumber(RandomStringUtils.randomAlphanumeric(8));
        booking.setStatus(BookingStatus.BOOKED);
        booking.setTotalPrice(totalPrice);
        model.addAttribute("booking", booking);
        return "/user/booking-page";
    }

    @RequestMapping(value = {"/remove/{roomId}"})
    public String deleteSessionBookingDetailPage(Model model,
            @PathVariable("roomId") int roomId,
            HttpSession session
    ) {
        BookingEntity booking = (BookingEntity) session.getAttribute("booking");
        List<BookingDetailEntity> bookingDetail = booking.getBookingDetails();

        if (booking != null && bookingDetail != null && bookingDetail.size() > 0) {
            for (int i = 0; i < bookingDetail.size(); i++) {
                if (bookingDetail.get(i).getRoom().getId() == roomId) {
                    bookingDetail.remove(i);
                }
            }
            booking.setBookingDetails(bookingDetail);
        }
        return "redirect:/view-booking";
    }

//    Service
    @RequestMapping(value = {"/add-service/{roomId}"})
    public String addServicePage(Model model,
            HttpSession session,
            @PathVariable("roomId") int roomId
    ) {
        BookingEntity booking = (BookingEntity) session.getAttribute("booking");
        if (booking != null && roomId > 0 && booking.getBookingDetails() != null && booking.getBookingDetails().size() > 0) {
            for (BookingDetailEntity bd : booking.getBookingDetails()) {
                if (bd.getRoom() != null && bd.getRoom().getId() == roomId) {
//                    ServiceEntity service = serviceService.findById(serviceId);
                    List<ServiceBookingEntity> services = bd.getServiceBookings();
                    session.setAttribute("serviceBooking", services);
                }

            }
        }
        session.getAttribute("serviceBooking");
        session.getAttribute("booking");
        model.addAttribute("service", serviceService.getServices());
        session.setAttribute("roomId", roomId);

        return "/user/add-service-page";
    }
//back to booking delete session

    @RequestMapping(value = {"/add-service-detail/{serviceId}"})
    public String buttonAddServicePage(Model model,
            @PathVariable("serviceId") int serviceId,
            HttpSession session
    ) {
        BookingEntity booking = (BookingEntity) session.getAttribute("booking");
        int roomId = (int) session.getAttribute("roomId");
        if (booking != null && roomId > 0 && booking.getBookingDetails() != null && booking.getBookingDetails().size() > 0) {
            for (BookingDetailEntity bd : booking.getBookingDetails()) {
                if (bd.getRoom() != null && bd.getRoom().getId() == roomId) {
                    ServiceEntity service = serviceService.findById(serviceId);
                    List<ServiceBookingEntity> services = bd.getServiceBookings();
                    if (services != null && services.size() > 0) {
                        boolean isExist = false;
                        // n?u dó cú service quantity +1;
                        // chua tụn t?i thỡ add m?i
                        for (ServiceBookingEntity sv : services) {
                            if (sv.getService() != null && sv.getService().getId() == serviceId) {
                                isExist = true;
                                break;
                            }
                        }
                        if (!isExist) {
                            ServiceBookingEntity serviceBooking = new ServiceBookingEntity();
                            serviceBooking.setBookingDetail(bd);
                            serviceBooking.setPrice(service.getPrice());
                            serviceBooking.setQuantity(1);
                            serviceBooking.setServiceBookDate(LocalDate.now());
                            serviceBooking.setService(service);

                            services.add(serviceBooking);
                            bd.setServiceBookings(services);

                        } else {
                            for (ServiceBookingEntity sv : services) {
                                if (sv.getService() != null && sv.getService().getId() == serviceId) {
                                    int quantity = sv.getQuantity() + 1;
                                    double totalPrice = quantity * sv.getService().getPrice();
                                    sv.setQuantity(quantity);
                                    sv.setPrice(totalPrice);
                                }
                            }
                            bd.setServiceBookings(services);
                        }

                    } else {
                        services = new ArrayList<>();
                        ServiceBookingEntity serviceBooking = new ServiceBookingEntity();
                        serviceBooking.setBookingDetail(bd);
                        serviceBooking.setPrice(service.getPrice());
                        serviceBooking.setQuantity(1);
                        serviceBooking.setServiceBookDate(LocalDate.now());
                        serviceBooking.setService(service);
                        services.add(serviceBooking);
                        bd.setServiceBookings(services);
                    }
                    session.setAttribute("serviceBooking", services);
                }
            }
        }
        session.setAttribute("booking", booking);

        model.addAttribute("service", serviceService.getServices());
        return "/user/add-service-page";
    }

    @RequestMapping(value = {"/remove-service/{serviceId}"})
    public String removeServicePage(Model model,
            @PathVariable("serviceId") int serviceId,
            HttpSession session
    ) {
        BookingEntity booking = (BookingEntity) session.getAttribute("booking");
        int roomId = (int) session.getAttribute("roomId");
        if (booking != null && roomId > 0 && booking.getBookingDetails() != null && booking.getBookingDetails().size() > 0) {
            for (BookingDetailEntity bd : booking.getBookingDetails()) {
                if (bd.getRoom() != null && bd.getRoom().getId() == roomId) {
//                    ServiceEntity service = serviceService.findById(serviceId);
                    List<ServiceBookingEntity> servicesBooking = bd.getServiceBookings();
                    for (int i = 0; i < servicesBooking.size(); i++) {
                        if (servicesBooking.get(i).getService() != null && servicesBooking.get(i).getService().getId() == serviceId) {
                            servicesBooking.remove(i);
                            break;
                        }
                    }

                    bd.setServiceBookings(servicesBooking);
                    session.setAttribute("serviceBooking", servicesBooking);
                }
            }
        }
        session.setAttribute("booking", booking);
        model.addAttribute("service", serviceService.getServices());
        return "/user/add-service-page";
    }

    @RequestMapping(value = {"/price-service/{serviceId}"}, method = RequestMethod.POST)
    public String totalPriceServicePage(Model model,
            @PathVariable("serviceId") int serviceId,
            @RequestParam(name = "quantity") int quantity,
            HttpSession session
    ) {
        BookingEntity booking = (BookingEntity) session.getAttribute("booking");
        int roomId = (int) session.getAttribute("roomId");
        if (booking != null && roomId > 0 && booking.getBookingDetails() != null && booking.getBookingDetails().size() > 0) {
            for (BookingDetailEntity bd : booking.getBookingDetails()) {
                if (bd.getRoom() != null && bd.getRoom().getId() == roomId) {
                    ServiceEntity service = serviceService.findById(serviceId);
                    List<ServiceBookingEntity> servicesBooking = bd.getServiceBookings();
                    for (int i = 0; i < servicesBooking.size(); i++) {
                        if (servicesBooking.get(i).getService() != null && servicesBooking.get(i).getService().getId() == serviceId) {
                            double totalPrice = servicesBooking.get(i).getService().getPrice() * quantity;
                            servicesBooking.get(i).setQuantity(quantity);
                            servicesBooking.get(i).setPrice(totalPrice);
                        }
                    }
                    bd.setServiceBookings(servicesBooking);
                    session.setAttribute("serviceBooking", servicesBooking);
                }
            }
        }
        session.setAttribute("booking", booking);
        model.addAttribute("service", serviceService.getServices());
        return "/user/add-service-page";
    }

    @RequestMapping(value = {"/confirm-booking"})
    public String confirmBookingPage(Model model,
            HttpSession session) {

        model.addAttribute("genders", Gender.values());
        return "/user/confirm-booking-page";
    }

    @RequestMapping(value = {"/credit-card"})
    public String creditCardPage(Model model,
            @RequestParam(name = "full_name", required = false) String fullName,
            @RequestParam(name = "email", required = false) String email,
            @RequestParam(name = "gender", required = false) Gender gender,
            @RequestParam(name = "phone_number", required = false) String phoneNumber,
            @RequestParam(name = "address", required = false) String address,
            @RequestParam(name = "birthdate", required = false) String birthdate,
            HttpSession session) {
        BookingEntity booking = (BookingEntity) session.getAttribute("booking");
        if (booking != null && booking.getBookingDetails() != null
                && booking.getBookingDetails().size() > 0) {

            booking.setFullName(fullName);
            booking.setGender(gender);
            booking.setEmail(email);
            booking.setPhoneNumber(phoneNumber);
            booking.setAddress(address);

            LocalDate birthDate = LocalDate.now();
            try {
                DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                birthDate = LocalDate.parse(birthdate, dateTimeFormatter);
            } catch (Exception e) {
            }
            booking.setBirthDate(birthDate);
        }
        model.addAttribute("genders", Gender.values());
        model.addAttribute("birthdate", birthdate);
        model.addAttribute("booking", booking);
        return "/user/credit-card-page";
    }

    @RequestMapping(value = {"/result-booking"}, method = RequestMethod.POST)
    public String resultPage(Model model,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam(name = "cardNumber", required = false) String cardNumber,
            @RequestParam(name = "expireDate", required = false) String expireDate,
            @RequestParam(name = "cvv", required = false) String cvv,
            HttpSession session) {

        CreditCardEntity creditCardEntity = creditCardService.creditCard(cardNumber);
        LocalDate expDate = LocalDate.now();
        try {
            DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            expDate = LocalDate.parse(expireDate, dateTimeFormatter);
        } catch (Exception e) {
        }
        if (creditCardEntity != null && creditCardEntity.getName().equals(name) && creditCardEntity.getCvcCode().equals(cvv)) {
            BookingEntity booking = (BookingEntity) session.getAttribute("booking");
            if (creditCardEntity.getBalance() >= booking.getTotalPrice()) {
                if (booking != null && booking.getBookingDetails() != null
                        && booking.getBookingDetails().size() > 0) {
                    bookingService.save(booking);
                    List<BookingDetailEntity> bookingDetail = booking.getBookingDetails();
                    for (BookingDetailEntity bd : bookingDetail) {
                        bookingDetailService.save(bd);
                        List<ServiceBookingEntity> services = bd.getServiceBookings();
                        if (services != null && services.size() != 0) {
                            for (ServiceBookingEntity service : services) {
                                serviceBookingService.save(service);
                            }
                        }
                    }
                }
                double balance = creditCardEntity.getBalance() - booking.getTotalPrice();
                creditCardEntity.setBalance(balance);
                creditCardService.save(creditCardEntity);

                PaymentEntity payment = new PaymentEntity();
                payment.setAmount(booking.getTotalPrice());
                payment.setBooking(booking);
                payment.setPaymentDate(LocalDate.now());
                payment.setCreditCard(creditCardEntity);
                paymentService.save(payment);
                List<BookingDetailEntity> bookingDetail = booking.getBookingDetails();

                SimpleMailMessage message = new SimpleMailMessage();
                message.setTo(booking.getEmail());
                message.setSubject("You have successfully paid !");
                String messageSend = "Thank you " + booking.getFullName() + " for using the hotel's service" + ",\n"
                        + "Information Detail: /n"
                        + "Full name: " + booking.getFullName() + ",\n"
                        + "Phone number: " + booking.getPhoneNumber() + ",\n"
                        + "Check in date: " + booking.getCheckinDate() + " and check out date: " + booking.getCheckoutDate() + ",\n"
                        //                        + "Please click <a href = \" " +  \">here for more details"
                        + "Thank you for choosing SEAPLACE HOTEL. We look forward to hosting your stay." + "\n"
                        + "If you need to make changes or require assistance please call 0367019801 or email us at khanhpv801@gmail.com" + "\n"
                        + "We look forward to welcoming you soon!" + "\n"
                        + "Hope to see you again! SEAPLACE HOTEL";
                message.setText(messageSend);
                // Send Message!
                emailSender.send(message);

                session.removeAttribute("booking");
                session.removeAttribute("check_in");
                session.removeAttribute("check_out");
                session.removeAttribute("roomType");
                model.addAttribute("message", "You have successfully paid !");
                return "/user/payment-page";
            } else {
                model.addAttribute("message", "There is not enough money in your account to pay !");
                return "/user/credit-card-page";
            }
        } else {
            return "/user/credit-card-page";
        }
    }

    @RequestMapping(value = {"/view-booking/{bookingNumber}"})
    public String viewBookingHistoryPage(Model model,
            @PathVariable("bookingNumber") String bookingNumber,
            HttpSession session) {
        model.addAttribute("bookingDetail", bookingDetailService.findBookingDetailByBookingNumber(bookingNumber));
        return "/user/booking-history-page";
    }
}
