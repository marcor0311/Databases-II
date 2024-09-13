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
import entities.distribuidorEntity;


@WebServlet(name = "updateDistriServlet", urlPatterns = {"/funcional/updateDistri"})
public class updateDistriServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    //String idDisS = request.getParameter("idDis");
    //int idDis = Integer.parseInt(idDisS);       
    //String nombre = request.getParameter("nombre");   
    //String correo = request.getParameter("correo");
    //String telefonoS = request.getParameter("telefono");
    //int telefono = Integer.parseInt(telefonoS);
    
    /*
    *Funcionalidad
    */
    DBConnection base = Singleton.getDBConnection();
    distribuidorRepository disRepo = base.getDisRepo();
    distribuidorEntity distribuidor;
    
    distribuidor = new distribuidorEntity ( Integer.parseInt(request.getParameter("idDis")),
                                                             request.getParameter("nombre"),
                                                             request.getParameter("correo"),
                                          Integer.parseInt(request.getParameter("telefono"))
    );
    disRepo.update(distribuidor);
    base.desconectar();

    //request.getRequestDispatcher(".jsp").forward(request, response);
    
    }
}

