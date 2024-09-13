package interfaz.bd2interface;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import others.DBConnection;
import others.Singleton;

import repositories.distribuidorRepository;


@WebServlet(name = "borrarDistriServlet", urlPatterns = {"/funcional/borrarDistri"})
public class borrarDistriServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    //String idS = request.getParameter("idDis");
    //int id = Integer.parseInt(idS);
        
    /*
    *Funcionalidad
    */
    DBConnection base = Singleton.getDBConnection();
    distribuidorRepository disRepo = base.getDisRepo();

    int distribuidor = Integer.parseInt( request.getParameter("idDis"));
    
    disRepo.delete(distribuidor);
    base.desconectar();
    
    }
}

