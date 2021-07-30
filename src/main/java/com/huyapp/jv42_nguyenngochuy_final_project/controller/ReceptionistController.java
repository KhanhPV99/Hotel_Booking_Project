/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.controller;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.BookingDetailEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.BookingEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.GuestEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.PaymentEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.PromotionEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.RoomEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.ServiceBookingEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.ServiceEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.UserEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.UserRoleEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.enums.BookingStatus;
import com.huyapp.jv42_nguyenngochuy_final_project.enums.Gender;
import com.huyapp.jv42_nguyenngochuy_final_project.enums.RoomStatus;
import com.huyapp.jv42_nguyenngochuy_final_project.service.BookingDetailService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.BookingService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.ConvenientService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.GuestService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.PaymentService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.PromotionService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.RoomService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.RoomTypeService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.ServiceBookingService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.ServiceService;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/receptionist")
public class ReceptionistController {

    @Autowired
    private RoomService roomService;
    
    @Autowired
    private RoomTypeService roomTypeService;
    
    @Autowired
    private ServiceService serviceService;
    
    @Autowired
    private ServiceBookingService serviceBookingService;
    
    @Autowired
    private PromotionService promotionService;
    
    @Autowired
    private ConvenientService convenientService;
    
    @Autowired
    private BookingService bookingService;
    
    @Autowired
    private BookingDetailService bookingDetailService;
    
    @Autowired
    private PaymentService paymentService;
    
    @Autowired
    private GuestService guestService;
    
    @Autowired
    private JavaMailSender emailSender;

    
    @RequestMapping("/index")
    public String viewHome(Model model) {

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }

        model.addAttribute("message", "Hello Receptionist: " + username);
        return "receptionist/index";
    }
    
    @RequestMapping(value = {"/view-available-rooms"}, method = RequestMethod.GET)
    public String viewAvailableRooms(Model model) {
    // Save list of rooms
        List<RoomEntity> rooms = roomService.getAvailableRoomsExceptCheckedIn();
        // Get list of images of rooms
        for(int i = 0; i < rooms.size(); i++) {
            rooms.get(i).setImages(roomTypeService.searchRoomTypeByRoomId(rooms.get(i).getId()).getImages());
        }
        // Get list of convenients of rooms
        for(int i = 0; i < rooms.size(); i++) {
            rooms.get(i).setConvenients(convenientService.searchConvenients(roomTypeService.searchRoomTypeByRoomId(rooms.get(i).getId()).getId()));
        }
        // Get a discount from promotions of rooms
        LocalDate today = LocalDate.now();
        LocalDate tomorrow = today.plusDays(1);
        for(int i = 0; i < rooms.size(); i++) {
            List<PromotionEntity> promos = promotionService.searchPromotionAvailable(roomTypeService.searchRoomTypeByRoomId(rooms.get(i).getId()).getId(),today);
            rooms.get(i).setDiscounts(promos);
        }
        
        // Get list of bookings
        for(int i = 0; i < rooms.size(); i++) {
            List<BookingDetailEntity> bookingDetails = bookingDetailService.getBookingDetailsByRoomId(rooms.get(i).getId());
            List<BookingEntity> bookings = new ArrayList<>();
            for (int j = 0; j < bookingDetails.size(); j++) {
                bookings.add(bookingDetails.get(j).getBooking()); 
            }
            rooms.get(i).setBookings(bookings);
        }
        
        // Save rooms
        model.addAttribute("rooms", rooms);
    // End of Save list of rooms
        // Save list of available services
        model.addAttribute("services", serviceService.getAvailableServices());
        
        // Others
        model.addAttribute("tomorrow", tomorrow);
        return "receptionist/view-available-rooms";

    }
    
// BOOKING EDIT
    // View Booking
    @RequestMapping(value = {"/view-bookings"}, method = RequestMethod.GET)
    public String viewBookings(Model model,
            @RequestParam(name = "type", required = false) String type,
            @RequestParam(name = "message", required = false) String message) {
        model.addAttribute("bookings", bookingService.getBookings());
        model.addAttribute("type", type);
        model.addAttribute("message", message);
        model.addAttribute("today", LocalDate.now());
        return "receptionist/view-bookings";
    }
    // End of View Booking
    
    // Search Booking
    @RequestMapping(value = {"/search-booking"}, method = RequestMethod.POST)
    public String searchBookings(Model model,
            @RequestParam(name = "checkinDate", required = true) String checkinDate,
            @RequestParam(name = "checkoutDate", required = true) String checkoutDate){
        model.addAttribute("bookings", bookingService.searchBookings(LocalDate.parse(checkinDate), LocalDate.parse(checkoutDate)));
        model.addAttribute("checkinDate", checkinDate);
        model.addAttribute("checkoutDate", checkoutDate);
        return "receptionist/view-bookings";
    }
    // End of Search Booking
    
    // Edit Booking
    @RequestMapping(value = "/result-booking", method = RequestMethod.POST)
    public String resultBooking(Model model,
            @RequestParam(name = "id", required = true) int id,
            @RequestParam(name = "totalPrice", required = true) double totalPrice,
            @RequestParam(name = "status", required = true) BookingStatus status){
        BookingEntity booking = bookingService.findById(id);
        booking.setTotalPrice(totalPrice);
        booking.setStatus(status);
        bookingService.save(booking);
        // Add payment if checked out
        if(status == BookingStatus.CHECKED_OUT) {
            PaymentEntity payment = new PaymentEntity();
            payment.setAmount(totalPrice);
            payment.setPaymentDate(LocalDate.now());
            payment.setBooking(booking);
            paymentService.save(payment);
        }
        // End of Add payment if checked out
        if(status == BookingStatus.CANCELED) {
            // Create a Simple MailMessage.
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(booking.getEmail());
            message.setSubject("Your Booking Number: "+booking.getBookingNumber()+"has been canceled!");
            message.setText("Dear "+booking.getFullName()+",\n"+"We regret to inform you that your reservation at Booking Number: "+booking.getBookingNumber()+" has been cancelled.\n"
                    + "Hope to see you again! Thank you for your booking!");
            // Send Message!
            emailSender.send(message);
        }
        if(status == BookingStatus.CHECKED_IN) {
            return "redirect:/receptionist/booking-detail-add/"+id;
        }
        return "redirect:/receptionist/booking-edit/"+id;
    }
    // End of Edit Booking
    
    // Customer info controller
//    @RequestMapping(value = "/result-customer", method = RequestMethod.POST)
//    public String resultRoomBookingConfig(Model model,
//            @RequestParam(name = "bookingId", required = true) int bookingId,
//            @RequestParam(name = "bookingDetailId", required = true) int bookingDetailId,
//            @RequestParam(name = "numberOfGuests", required = true) int numberOfGuests){
//        List<GuestEntity> customers = new ArrayList<>();
//        model.addAttribute("customers", customers);
//        model.addAttribute("bookingId", bookingId);
//        model.addAttribute("bookingDetailId", bookingDetailId);
//        model.addAttribute("numberOfGuests", numberOfGuests);
//        model.addAttribute("gender", Gender.values());
//        return "receptionist/customer-info";
//    }
    
    
    // Delete Booking
    @RequestMapping("/booking-delete/{bookingId}")
    public String deleteBooking(Model model,
            @PathVariable("bookingId") int bookingId) {
        if (bookingService.deleteBooking(bookingId)) {
            return "redirect:/receptionist/view-bookings?type=error&message=Delete Booking Id: " + bookingId + " Fail!!!";
        } else {
            return "redirect:/receptionist/view-bookings?type=success&message=Delete Booking Id: " + bookingId + " success!!!";
        }
    }
    // End of Delete Booking
// END OF BOOKING EDIT
    
// BOOKING DETAIL EDIT
    // Edit booking detail
    @RequestMapping("/booking-edit/{bookingId}")
    public String editBooking(Model model,
            @PathVariable("bookingId") int bookingId) {
        model.addAttribute("booking", bookingService.findById(bookingId));
        model.addAttribute("status", BookingStatus.values());
        List<BookingDetailEntity> bookingDetails = bookingDetailService.getBookingDetailsByBookingId(bookingId);
        // Caculate unit prices for booking detail and total price for booking
        double totalPriceOfRoom = 0;
        for(int i = 0; i < bookingDetails.size(); i ++) {
            double unitprice = bookingDetails.get(i).getPrice() * (1 - bookingDetails.get(i).getDiscount()/100);
            if(!bookingDetails.get(i).getServiceBookings().isEmpty()) {
                for (int j = 0; j < bookingDetails.get(i).getServiceBookings().size(); j ++) {
                    unitprice += bookingDetails.get(i).getServiceBookings().get(j).getPrice() * bookingDetails.get(i).getServiceBookings().get(j).getQuantity();
                }
            }
            bookingDetails.get(i).setUnitPrice(unitprice);
            totalPriceOfRoom += unitprice;
        }
        // End of Caculate unit price for booking detail
        model.addAttribute("bookingDetails", bookingDetails);
        model.addAttribute("totalPriceOfRoom", totalPriceOfRoom * 1.1);
        return "receptionist/booking-edit";
    }
    // End of Edit booking detail
    
    // View Booking Detail
    @RequestMapping("/booking-view/{bookingId}")
    public String viewBooking(Model model,
            @PathVariable("bookingId") int bookingId) {
        BookingEntity booking = bookingService.findById(bookingId);
        model.addAttribute("booking", booking);
        List<BookingDetailEntity> bookingDetails = bookingDetailService.getBookingDetailsByBookingId(bookingId);
        // Caculate unit prices for booking detail for booking
        for(int i = 0; i < bookingDetails.size(); i ++) {
            double unitprice = bookingDetails.get(i).getPrice() * (1 - bookingDetails.get(i).getDiscount()/100);
            if(!bookingDetails.get(i).getServiceBookings().isEmpty()) {
                for (int j = 0; j < bookingDetails.get(i).getServiceBookings().size(); j ++) {
                    unitprice += bookingDetails.get(i).getServiceBookings().get(j).getPrice() * bookingDetails.get(i).getServiceBookings().get(j).getQuantity();
                }
            }
            bookingDetails.get(i).setUnitPrice(unitprice);
        }
        // End of Caculate unit price for booking detail
        model.addAttribute("bookingDetails", bookingDetails);
        
        // Show payment info if Checked out
        if(booking.getStatus() == BookingStatus.CHECKED_OUT) {
            List<PaymentEntity> payments = paymentService.getPaymentsByBookingId(bookingId);
            model.addAttribute("payments", payments);
        }
        // Show payment info if Checked out
        return "receptionist/booking-view";
    }
    // End of View Booking Detail
    
    // Update Booking Detail
    @RequestMapping("/booking-detail-edit/{bookingId}/{bookingDetailId}")
    public String editBookingDetail(Model model,
            @PathVariable("bookingId") int bookingId,
            @PathVariable("bookingDetailId") int bookingDetailId) {
        BookingDetailEntity bookingDetail = bookingDetailService.findById(bookingDetailId);
        List<ServiceBookingEntity> serviceBookings = bookingDetail.getServiceBookings();
        // Caculate unit price for booking detail
        double unitprice = bookingDetail.getPrice() * (1 - bookingDetail.getDiscount()/100);
        if(!serviceBookings.isEmpty()) {
            for(int i = 0; i < serviceBookings.size(); i ++) {
                unitprice += serviceBookings.get(i).getPrice() * serviceBookings.get(i).getQuantity();
            }
        }
        // End of Caculate unit price for booking detail
        bookingDetail.setUnitPrice(unitprice);
        model.addAttribute("bookingDetail", bookingDetail);
        model.addAttribute("services", serviceService.getAvailableServices());
        model.addAttribute("bookingId", bookingId);
        model.addAttribute("today", LocalDate.now());
        return "receptionist/booking-detail-edit";
    }
    
    // End of Update Booking Detail
    
    // Update service booking
    @RequestMapping(value = "/result-service-booking", method = RequestMethod.POST)
    public String resultServiceBooking(Model model,
            @Valid  @ModelAttribute("serviceBooking") ServiceBookingEntity serviceBooking,
            @RequestParam(name = "type", required = false) String type,
            @RequestParam(name = "message", required = false) String message) {
//        serviceBooking.setService(serviceService.findById(serviceBooking.getServiceId()));
//        serviceBooking.setBookingDetail(bookingDetailService.findById(serviceBooking.getBookingDetailId()));
//        serviceBookingService.save(serviceBooking);
        ServiceEntity service = serviceService.findById(serviceBooking.getServiceId());
        serviceBooking.setService(service);
        BookingDetailEntity bookingDetail = bookingDetailService.findById(serviceBooking.getBookingDetailId());
        List<ServiceBookingEntity> serviceBookings = bookingDetail.getServiceBookings();
        boolean checked = false;
        for (int i = 0; i < serviceBookings.size(); i++) {
            int quantity = serviceBookings.get(i).getQuantity();
            if (serviceBookings.get(i).getService().getName().equals(service.getName()) && 
                    serviceBooking.getServiceBookDate().compareTo(serviceBookings.get(i).getServiceBookDate()) == 0) {
                quantity += 1;
                checked = true;
            }
            serviceBookings.get(i).setQuantity(quantity);
            serviceBookingService.save(serviceBookings.get(i));
        }
        serviceBooking.setBookingDetail(bookingDetail);
        if(checked != true) {
            serviceBookingService.save(serviceBooking);
        }
        model.addAttribute("type", type);
        model.addAttribute("message", message);
        return "redirect:/receptionist/booking-detail-edit/"+serviceBooking.getBookingId()+"/"+serviceBooking.getBookingDetailId();
    }
    // End of Update service booking
    
    // Remove service booking
    @RequestMapping("/service-booking-delete/{bookingId}/{bookingDetailId}/{serviceBookingId}")
    public String deleteServiceBooking(Model model,
            @PathVariable("bookingId") int bookingId,
            @PathVariable("bookingDetailId") int bookingDetailId,
            @PathVariable("serviceBookingId") int serviceBookingId) {
        if (serviceBookingService.deleteServiceBooking(serviceBookingId)) {
            return "redirect:/receptionist/booking-detail-edit/" + bookingId + "/" + bookingDetailId + "?type=error&message=Delete Service Booking Id: " + serviceBookingId + " Fail!!!";
        } else {
            return "redirect:/receptionist/booking-detail-edit/"+ bookingId + "/" + bookingDetailId + "?type=success&message=Delete Service Booking Id: " + serviceBookingId + " success!!!";
        }
    }
    // End of Remove service booking
    
    // Update quantity service booking
    @RequestMapping(value = "/result-service-booking-quantity", method = RequestMethod.POST)
    public String resultServiceBookingQuantity(Model model,
            @RequestParam(name = "bookingId", required = true) int bookingId,
            @RequestParam(name = "bookingDetailId", required = true) int bookingDetailId,
            @RequestParam(name = "serviceBookingId", required = true) int serviceBookingId,
            @RequestParam(name = "quantity", required = true) int quantity) {
        ServiceBookingEntity servicebooking = serviceBookingService.findById(serviceBookingId);
        servicebooking.setQuantity(quantity);
        servicebooking.setBookingDetail(bookingDetailService.findById(bookingDetailId));
        serviceBookingService.save(servicebooking);
        return "redirect:/receptionist/booking-detail-edit/"+bookingId+"/"+bookingDetailId;
    }
    // End of Update quantity service booking
// BOOKING DETAIL EDIT
    
// INVOICE & INVOICE PRINT
    @RequestMapping("/invoice/{bookingId}")
    public String invoiceBooking(Model model,
            @PathVariable("bookingId") int bookingId) {
        model.addAttribute("booking", bookingService.findById(bookingId));
        List<BookingDetailEntity> bookingDetails = bookingDetailService.getBookingDetailsByBookingId(bookingId);
        // Caculate unit prices for booking detail for booking
        for(int i = 0; i < bookingDetails.size(); i ++) {
            double unitprice = bookingDetails.get(i).getPrice() * (1 - bookingDetails.get(i).getDiscount()/100);
            if(!bookingDetails.get(i).getServiceBookings().isEmpty()) {
                for (int j = 0; j < bookingDetails.get(i).getServiceBookings().size(); j ++) {
                    unitprice += bookingDetails.get(i).getServiceBookings().get(j).getPrice() * bookingDetails.get(i).getServiceBookings().get(j).getQuantity();
                }
            }
            bookingDetails.get(i).setUnitPrice(unitprice);
        }
        // End of Caculate unit price for booking detail
        model.addAttribute("bookingDetails", bookingDetails);
        model.addAttribute("today", LocalDate.now());
        return "receptionist/invoice";
    }
    
    @RequestMapping("/invoice-print/{bookingId}")
    public String invoicePrintBooking(Model model,
            @PathVariable("bookingId") int bookingId) {
        model.addAttribute("booking", bookingService.findById(bookingId));
        List<BookingDetailEntity> bookingDetails = bookingDetailService.getBookingDetailsByBookingId(bookingId);
        // Caculate unit prices for booking detail for booking
        for(int i = 0; i < bookingDetails.size(); i ++) {
            double unitprice = bookingDetails.get(i).getPrice() * (1 - bookingDetails.get(i).getDiscount()/100);
            if(!bookingDetails.get(i).getServiceBookings().isEmpty()) {
                for (int j = 0; j < bookingDetails.get(i).getServiceBookings().size(); j ++) {
                    unitprice += bookingDetails.get(i).getServiceBookings().get(j).getPrice() * bookingDetails.get(i).getServiceBookings().get(j).getQuantity();
                }
            }
            bookingDetails.get(i).setUnitPrice(unitprice);
        }
        // End of Caculate unit price for booking detail
        model.addAttribute("bookingDetails", bookingDetails);
        model.addAttribute("today", LocalDate.now());
        return "receptionist/invoice-print";
    }
// END OF INVOICE & INVOICE PRINT
    
// Customer Booking Controller
    @RequestMapping("/customer-info-edit/{action}/{bookingId}/{bookingDetailId}")
    public String editBookingCustomer(Model model,
            @PathVariable(name = "action", required = false) String action,
            @PathVariable(name = "bookingId", required = false) int bookingId,
            @PathVariable(name = "bookingDetailId", required = false) int bookingDetailId,
            @RequestParam(name = "type", required = false) String type,
            @RequestParam(name = "message", required = false) String message) {
        BookingDetailEntity bookingDetail = bookingDetailService.findById(bookingDetailId);
        List<GuestEntity> guests = guestService.getGuestsByBookingDetailId(bookingDetailId);
        List<GuestEntity> registeredCustomers = guestService.getGuests();
        model.addAttribute("bookingDetail", bookingDetail);
        model.addAttribute("bookingId", bookingId);
        model.addAttribute("guests", guests);
        model.addAttribute("registeredCustomers", registeredCustomers);
        model.addAttribute("type", type);
        model.addAttribute("message", message);
        model.addAttribute("action", action);
        return "receptionist/customer-view";
    }
    
    @RequestMapping(value = "/customer-add/{bookingId}/{bookingDetailId}")
    public String addCustomer(Model model,
            @PathVariable("bookingId") int bookingId,
            @PathVariable("bookingDetailId") int bookingDetailId) {
        model.addAttribute("guest", new GuestEntity());
        model.addAttribute("gender", Gender.values());
        model.addAttribute("today", LocalDate.now());
        model.addAttribute("bookingId", bookingId);
        model.addAttribute("bookingDetailId", bookingDetailId);
        model.addAttribute("action", "add");
        return "receptionist/customer-add";
    }
    
    @RequestMapping("/customer-edit/{bookingId}/{bookingDetailId}/{customerId}")
    public String editCustomer(Model model,
            @PathVariable("bookingId") int bookingId,
            @PathVariable("bookingDetailId") int bookingDetailId,
            @PathVariable("customerId") int customerId) {
        model.addAttribute("guest", guestService.findById(customerId));
        model.addAttribute("gender", Gender.values());
        model.addAttribute("bookingId", bookingId);
        model.addAttribute("bookingDetailId", bookingDetailId);
        model.addAttribute("action", "edit");
        
        return "receptionist/customer-add";
    }
    
    @RequestMapping(value = "/result-customer", method = RequestMethod.POST)
    public String resultCustomer(Model model,
            @Valid  @ModelAttribute("guest") GuestEntity newGuest,
            @RequestParam(name = "action", required = true) String action,
            @RequestParam(name = "bookingId", required = true) int bookingId,
            @RequestParam(name = "bookingDetailId", required = true) int bookingDetailId,
            @RequestParam(name = "registeredCustomerId", required = false) Integer registeredCustomerId) {
        if (registeredCustomerId != null) {
            GuestEntity registeredCustomer = guestService.findById(registeredCustomerId);
            registeredCustomer.setBookingDetail(bookingDetailService.findById(bookingDetailId));
            guestService.save(registeredCustomer);
        } else {
            newGuest.setBookingDetail(bookingDetailService.findById(bookingDetailId));
            guestService.save(newGuest);
        }
        return "redirect:/receptionist/customer-info-edit/"+action+"/"+bookingId+"/"+bookingDetailId;
    }
    
    @RequestMapping("/customer-delete/{action}/{bookingId}/{bookingDetailId}/{customerId}")
    public String deleteCustomer(Model model,
            @PathVariable(name = "action", required = false) String action,
            @PathVariable("bookingId") int bookingId,
            @PathVariable("bookingDetailId") int bookingDetailId,
            @PathVariable("customerId") int customerId) {
        if (guestService.deleteGuest(customerId)) {
            return "redirect:/receptionist/customer-info-edit/"+action+"/"+bookingId+"/"+bookingDetailId+"?type=error&message=Delete Customer Id: " + customerId + " Fail!!!";
        } else {
            return "redirect:/receptionist/customer-info-edit/"+action+"/"+bookingId+"/"+bookingDetailId+"?type=success&message=Delete Customer Id: " + customerId + " success!!!";
        }
    }
    
    @RequestMapping("/customer-remove/{action}/{bookingId}/{bookingDetailId}/{customerId}")
    public String removeCustomer(Model model,
            @PathVariable(name = "action", required = false) String action,
            @PathVariable("bookingId") int bookingId,
            @PathVariable("bookingDetailId") int bookingDetailId,
            @PathVariable("customerId") int customerId) {
        GuestEntity guest = guestService.findById(customerId);
        guest.setBookingDetail(null);
        guestService.save(guest);
        return "redirect:/receptionist/customer-info-edit/"+action+"/"+bookingId+"/"+bookingDetailId;
    }
    
    @RequestMapping("/booking-detail-add/{bookingId}")
    public String addNewCustomer(Model model,
            @PathVariable("bookingId") int bookingId) {
        model.addAttribute("booking", bookingService.findById(bookingId));        
        model.addAttribute("bookingDetails", bookingDetailService.getBookingDetailsByBookingId(bookingId));
        return "receptionist/booking-detail-add";
    }
    
// End of Customer Booking Controller
}
