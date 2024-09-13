package interfaz.bd2interface;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import others.DBConnection;
import others.Singleton;

import repositories.TTRepository;


@WebServlet(name = "borrarTTServlet", urlPatterns = {"/funcional/borrarTT"})
public class borrarTTServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    //String idS = request.getParameter("id");
    //int id = Integer.parseInt(idS);
        
    /*
    *Funcionalidad
    */
    DBConnection base = Singleton.getDBConnection();
    TTRepository TTRepo = base.getTTRepo();

    int transaccion = Integer.parseInt( request.getParameter("idOrd"));
    
    TTRepo.delete(transaccion);
    base.desconectar();

    }
}


