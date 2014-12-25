/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.io.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import java.sql.*;
/**
 *
 * @author imdadareeph
 */
public class InviteClass {

    String to,from,msg,sub=null;
    public static Properties props=null;
    public static Session session=null;

    /** Creates a new instance of MailClass */

   public static String SendMessage(String emailto, String emailfrom, String emailmultipart, String subject,String msgText)
  {
	final String username = "asinet2011@gmail.com";
	final String password = "Asinet@123";   
    boolean debug = false; // change to get more information
    String msgText2 = "multipart message";
    boolean sendmultipart = Boolean.valueOf(emailmultipart).booleanValue();
    // set the host
    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.smtp.host", "smtp.gmail.com");
	props.put("mail.smtp.port", "587");
   // props.put("smtp.mail.com", "192.168.0.1");
	/*
	The String variable host contains the DNS name of a server that accepts connections on port 25 for SMTP.
	Adding this property to the props collection, which is in turn passed into Javamail,
	tells Javamail what host to send the mail to, initially.
	*/

    // create some properties and get the default Session
   // Session session = Session.getDefaultInstance(props, null);
	Session session = Session.getInstance(props,
			  new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			  });
    session.setDebug(debug);
    try
    {
      // create a message
      Message msg = new MimeMessage(session);
      // set the from
      InternetAddress from = new InternetAddress(emailfrom);
      msg.setFrom(from);
      InternetAddress[] address =
      {
        new InternetAddress(emailto)
      };
      msg.setRecipients(Message.RecipientType.TO, address);
      msg.setSubject(subject);
      if(!sendmultipart)
      {
        // send a plain text message
        msg.setContent(msgText, "text/plain");
      }
      else
      {
        // send a multipart message// create and fill the first message part
        MimeBodyPart mbp1 = new MimeBodyPart();
        mbp1.setContent(msgText, "text/plain");
        // create and fill the second message part
        MimeBodyPart mbp2 = new MimeBodyPart();
        mbp2.setContent(msgText2, "text/plain");
        // create the Multipart and its parts to it
        Multipart mp = new MimeMultipart();
        mp.addBodyPart(mbp1);
        mp.addBodyPart(mbp2);
        // add the Multipart to the message
        msg.setContent(mp);
      }
      Transport.send(msg);
    }
    catch(MessagingException mex)
    {
      mex.printStackTrace();
    }
    System.out.println("Mail sent successfully");
    return "Email sent to " + emailto;
  }

}


