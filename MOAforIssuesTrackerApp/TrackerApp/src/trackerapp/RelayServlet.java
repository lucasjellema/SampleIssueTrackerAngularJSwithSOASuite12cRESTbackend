package trackerapp;

import java.io.IOException;
import java.io.PrintWriter;

import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

@WebServlet(name = "RelayServlet", urlPatterns = { "/relayservlet" })
public class RelayServlet extends HttpServlet {
    private static final String CONTENT_TYPE = "application/json; charset=utf-8";
    private static final String DOC_TYPE = null;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        if (DOC_TYPE != null) {
            out.println(DOC_TYPE);
        }
        String direction = request.getParameter("direction");
        String sort = request.getParameter("sort");
        String state = request.getParameter("state");
        
     invokeAndReturnRESTservice(out, direction, sort, state);
        out.close();
    }
    
    private void invokeAndReturnRESTservice(PrintWriter out,String direction, String sort, String state)
    {
        try {
     
                    URL url = new URL("http://soa2admin2:8011/TrackerIssuesRestService/issues?direction="+direction+"&sort="+sort+"&state="+state);
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.setRequestMethod("GET");
                    conn.setRequestProperty("Accept", "application/json");
     
                    if (conn.getResponseCode() != 200) {
                            throw new RuntimeException("Failed : HTTP error code : "
                                            + conn.getResponseCode());
                    }
     
                    BufferedReader br = new BufferedReader(new InputStreamReader(
                            (conn.getInputStream())));
     
                    String output;
                    System.out.println("Output from Server .... \n");
                    while ((output = br.readLine()) != null) {
                            System.out.println(output);
                        out.print(output);
                    }
     
                    conn.disconnect();
     
              } catch (MalformedURLException e) {
     
                    e.printStackTrace();
     
              } catch (IOException e) {
     
                    e.printStackTrace();
     
              }
}
}
