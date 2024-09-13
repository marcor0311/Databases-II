package interfaz.bd2interface;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import others.DBConnection;
import others.Singleton;

import repositories.productoRepository;


@WebServlet(name = "borrarProductoServlet", urlPatterns = {"/funcional/borrarProducto"})
public class borrarProductoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    //String idS = request.getParameter("idProducto");
    //int id = Integer.parseInt(idS);
        
    /*
    *Funcionalidad
    */
    DBConnection base = Singleton.getDBConnection();
    productoRepository prodRepo = base.getProdRepo();

    int producto = Integer.parseInt( request.getParameter("idProducto"));
    
    prodRepo.delete(producto);
    base.desconectar();
    
    }
}

