package com.mycompany.controller;

import com.mycompany.entities.OrderDetail;
import com.mycompany.entities.Orders;
import com.mycompany.entities.Product;
import com.mycompany.service.OrderHistory;
import com.mycompany.service.OrderHistoryImpl;
import com.mycompany.service.OrderService;
import com.mycompany.service.PaypalService;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
public class PaypalController {

    @Autowired
    PaypalService service;
    @Autowired
    OrderService orderService;
//    @Autowired
//    OrderHistoryImpl historyService;
   
    
   

    @GetMapping("/cancel")
    public String cancelPay() {
        return "cancel";
    }
@GetMapping("/checkout")
    public String checkout(HttpServletRequest request, Model model) {
        List<Product> productList = (List<Product>) request.getSession().getAttribute("cart");
        if(productList == null || productList.isEmpty()){
            return "productList";
        }
        OrderDetail orderDetail = orderService.prepareOrderDetail(productList);
        model.addAttribute("orderDetail",orderDetail);
        return "checkout";
    }

    @PostMapping("/checkout")
    public String proceedCheckout(HttpServletRequest request, Model model) {

        return "checkout";
    }



    
    @PostMapping("/authorize_payment")
    public String authorizePayment(@ModelAttribute OrderDetail orderDetail, Model model){
        System.out.println("OrderDetail="+orderDetail);
        try {
            String approvalLink = service.authorizePayment(orderDetail);
            System.out.println("approvalLink==="+approvalLink);
            return "redirect:"+approvalLink;
            
        } catch (PayPalRESTException ex) {
            Logger.getLogger(PaypalController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("errorMessage", ex.getMessage());
            return "error";
        }
    }
    
    @GetMapping("/review_payment")
    public String reviewPayment(Model model,
            @RequestParam("paymentId") String paymentId,
            @RequestParam("PayerID") String payerId) {
        try {
            Payment payment = service.getPaymentDetails(paymentId);
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
            model.addAttribute("paymentId", paymentId);
            model.addAttribute("PayerID", payerId);
            model.addAttribute("payer", payerInfo);
            model.addAttribute("transaction", transaction);
            model.addAttribute("shippingAddress", shippingAddress);
            return "review";
        } catch (PayPalRESTException ex) {
            Logger.getLogger(PaypalController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("errorMessage", ex.getMessage());
            return "error";
        }
    }
    @PostMapping("/execute_payment")
    public String executePayment(Model model,
            @RequestParam("paymentId") String paymentId,
            @RequestParam("PayerID") String payerId,HttpServletRequest request){
        try {
            Payment payment = service.executePayment(paymentId, payerId);
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            model.addAttribute("payer", payerInfo);
            model.addAttribute("transaction", transaction);
       
//        List<Product> productList = (List<Product>) request.getSession().getAttribute("cart");
//      
//        System.out.println(productList);
//        request.getSession().setAttribute("cart",productList);
//        
//        int total=0;
//        for(Product p:productList){
//            total+=p.getPprice();
//        }
//      
//        Orders ord=new Orders(productList.size(),total);  
//         historyService.createOrUpdateOrder(ord);

                   

              request.getSession().removeAttribute("cart");
            return "receipt";
        } catch (PayPalRESTException ex) {
            Logger.getLogger(PaypalController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("errorMessage", ex.getMessage());
            return "error";
        }
    }
}
