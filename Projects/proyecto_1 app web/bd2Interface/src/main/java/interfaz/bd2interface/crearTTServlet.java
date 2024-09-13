package interfaz.bd2interface;


import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import others.DBConnection;
import others.Singleton;

import entities.TTEntity;
import repositories.TTRepository;



@WebServlet(name = "crearTTServlet", urlPatterns = {"/funcional/crearTT"})
public class crearTTServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    //String producto = request.getParameter("nombre");
    //String descripcion = request.getParameter("descripcion"); 
    //String precioUS = request.getParameter("precioU");
    //int precioU = Integer.parseInt(precioUS);
    //String cantidadDS = request.getParameter("cantidadD");
    //int cantidadD = Integer.parseInt(cantidadDS);
    //String idDisS = request.getParameter("idDis");
    //int idDis = Integer.parseInt(idDisS);
    
    /*
    *Funcionalidad
    */
    DBConnection base = Singleton.getDBConnection();
    TTRepository TTRepo = base.getTTRepo();
    TTEntity transaccion;
    
    transaccion = new TTEntity (Integer.parseInt(request.getParameter("idOrd")),
                            Integer.parseInt(request.getParameter("idProducto")),
                              Integer.parseInt(request.getParameter("cantidad"))
    );
    TTRepo.save(transaccion);
    base.desconectar();

    //request.getRequestDispatcher("comprarOVender.jsp").forward(request, response);
    }  
}

