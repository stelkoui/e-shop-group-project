package com.mycompany.config;

import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/* PropertySource annotation defines the external properties file location, in this case the properties file located in classpath. 
 * Then PropertySourcesPlaceholderConfigurer class will read and parse the properties in key value pair saved in this file.
 *  */
@PropertySource("classpath:database.properties")
@Configuration
public class PaypalConfig {

    @Value("${paypal.client.id}")
    private String clientId;
    @Value("${paypal.client.secret}")
    private String clientSecret;
    @Value("${paypal.mode}")
    private String mode;


    @Bean
    public APIContext apiContext() throws PayPalRESTException {
        APIContext context = new APIContext(clientId, clientSecret, mode);
        //context.setConfigurationMap(paypalSdkConfig());
        return context;
    }

}
