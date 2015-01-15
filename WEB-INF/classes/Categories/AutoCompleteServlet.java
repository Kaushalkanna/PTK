package Categories;



import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author Priya
 */
public class AutoCompleteServlet extends HttpServlet {

    private ServletContext context;
   private HashMap<String,User> userlist =new HashMap<String,User>();;
    @Override
    
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }

    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action");
        String targetId = request.getParameter("id");
        StringBuffer sb = new StringBuffer();
        String targetIdl = null;
        if (targetId != null) {
        	targetIdl = targetId.trim().toLowerCase();
        } else {
            context.getRequestDispatcher("/error.jsp").forward(request, response);
        }

        boolean namesAdded = false;
        if (action.equals("complete")) {

            // check if user sent empty string
            if (!targetId.equals("")) {
            	
            	//ServletContext sc = this.getServletContext();
        		String path = context.getRealPath("/WEB-INF/userInfo.txt");
        		List<String> lines = new ArrayList<String>();
        		FileReader fr = new FileReader(path);
        		BufferedReader bf = new BufferedReader(fr);
        		try {
        			String aLine = null;
        			
        			while ((aLine = bf.readLine()) != null && bf.ready()) {
        				System.out.println(aLine);
        				if ( // targetId matches first name
        						aLine.toLowerCase().startsWith(targetIdl) ||
                                // targetId matches last name
        						aLine.toLowerCase().startsWith(targetIdl) ||
                                // targetId matches full name
        						aLine.toLowerCase().concat(" ")
                                   .concat(aLine.toLowerCase()).startsWith(targetIdl)) {

        				 				lines.add(aLine);
        				 				StringBuilder comma = new StringBuilder();
        				 				for ( int i = 0; i< lines.size(); i++){
        				 					comma.append(lines.get(i));

        				 					if ( i != lines.size()-1){

        				 					comma.append(",");

        				 					}
        				 				}
        				 				//System.out.println(comma.toString());	
        				 				String input = comma.toString();
        				 				String part[] = input.split(",");
        				 				userlist.put(part[0], new User(part[2]+" "+part[3]+"", part[7] , part[6] , part[4] , part[5] , part[0]));
        				 				
        				 				sb.append("<users>");
        		                        sb.append("<name>" + part[0] + "</name>");
        		                       
        		                        sb.append("</users>");
        		                        namesAdded = true;
                        
        				}				
        			}
        		}catch(Exception e){
        			ErrorHandling.printMessage("Sorry the operation was not completed, Please try again",response);
    				
        		} 
        		finally 
        		{
        			fr.close();
        			bf.close();
        		}
                
                }
            

            if (namesAdded) {
                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("<users>"+sb.toString()+"</users>");
            } else {
                //nothing to show
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            }
        }

        if (action.equals("lookup")) {

            // put the target composer in the request scope to display 
            if ((targetId != null) ) {
        
            	 if ((targetId != null) && userlist.containsKey(targetId.trim())) {
                         request.setAttribute("users", userlist.get(targetId));
		                context.getRequestDispatcher("/users.jsp").forward(request, response);
            	 }
            }
        }
        if (action.equals("check")) {

            // put the target composer in the request scope to display 
            if ((targetId != null) ) {
        
            	 if ((targetId != null) && userlist.containsKey(targetId.trim())) {
                         request.setAttribute("toname", targetId);
		                context.getRequestDispatcher("/messages.jsp").forward(request, response);
            	 }
            }
        }
    }
}
        
    

    
        
