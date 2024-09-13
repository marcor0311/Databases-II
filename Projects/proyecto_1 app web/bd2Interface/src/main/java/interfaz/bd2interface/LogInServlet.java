package interfaz.bd2interface;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "LogInServlet", urlPatterns = {"/login"})
public class LogInServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String user = request.getParameter("user");
        String password = request.getParameter("password");
        
        /*
         *SI EL USUARIO ESTÁ EN LA BASES DE DATOS:
         */
        if (user.equals("user") && password.equals("123")){
          
            RequestDispatcher dispatcher = request.getRequestDispatcher("mainmenu.jsp");
            dispatcher.forward(request, response);
        }else{
            String errorMessage = "Usuario o contraseña incorrectos. Intente de nuevo.";
            request.setAttribute("errorMessage", errorMessage);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
    }
}