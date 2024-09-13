package interfaz.bd2interface;


import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import others.DBConnection;
import others.Singleton;

import entities.productoEntity;
import repositories.productoRepository;


@WebServlet(name = "updateProductoServlet", urlPatterns = {"/funcional/updateProducto"})
public class updateProductoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    //String idProductoS = request.getParameter("idProducto");
    //int idProducto = Integer.parseInt(idProductoS);  
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
    productoRepository prodRepo = base.getProdRepo();
    productoEntity producto;
    
    producto = new productoEntity ( Integer.parseInt(request.getParameter("idProducto")),
                                                    request.getParameter("nombre"),
                                                 request.getParameter("descripcion"),
                                 Integer.parseInt(request.getParameter("precioU")),
                                Integer.parseInt(request.getParameter("cantidadD")),
                                  Integer.parseInt(request.getParameter("idDis"))
    );
    prodRepo.update(producto);
    base.desconectar();
  
    
    }
}

