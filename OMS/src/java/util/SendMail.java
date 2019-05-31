package util;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendMail {


    public static void main(String[] args) throws Exception {
        
        Properties prop = new Properties();
        prop.setProperty("mail.host", "smtp.gmail.com");
        prop.setProperty("mail.transport.protocol", "smtp");
        prop.setProperty("mail.smtp.auth", "true");
        Session session = Session.getInstance(prop);
        session.setDebug(true);
        Transport ts = session.getTransport();
        ts.connect("smtp.gmail.com", "76manshi76@gmail.com", "qazplm76");
        Message message = createSimpleMail(session);
        ts.sendMessage(message, message.getAllRecipients());
        ts.close();
    }
    
    
    public static void send()  throws Exception {
    	Properties prop = new Properties();
        prop.setProperty("mail.host", "smtp.gmail.com");
        prop.setProperty("mail.transport.protocol", "smtp");
        prop.setProperty("mail.smtp.auth", "true");
        Session session = Session.getInstance(prop);
        session.setDebug(true);
        Transport ts = session.getTransport();
        ts.connect("smtp.gmail.com", "76manshi76@gmail.com", "qazplm76");
        Message message = createSimpleMail(session);
        ts.sendMessage(message, message.getAllRecipients());
        ts.close();
    }
    public static MimeMessage createSimpleMail(Session session)
            throws Exception {
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress("76manshi76@gmail.com"));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress("76manshi76@gmail.com"));
        message.setSubject("Thank you for purchasing");
        message.setContent("Thank you for purchasing", "text/html;charset=UTF-8");
        return message;
    }
}