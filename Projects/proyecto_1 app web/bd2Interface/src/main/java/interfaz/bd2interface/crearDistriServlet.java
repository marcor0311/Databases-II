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


@WebServlet(name = "crearDistriServlet", urlPatterns = {"/funcional/crearDistri"})
public class crearDistriServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
    
    distribuidor = new distribuidorEntity (request.getParameter("nombre"),
                                           request.getParameter("correo"),
                       Integer.parseInt(request.getParameter("telefono"))
    );
    disRepo.save(distribuidor);
    base.desconectar();

    //request.getRequestDispatcher(".jsp").forward(request, response);
    } 
}

