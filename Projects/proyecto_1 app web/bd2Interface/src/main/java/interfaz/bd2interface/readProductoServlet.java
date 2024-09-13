package interfaz.bd2interface;

import jakarta.servlet.RequestDispatcher;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;

import others.DBConnection;
import others.Singleton;

import entities.productoEntity;
import repositories.productoRepository;


@WebServlet(name = "readProductoServlet", urlPatterns = {"/funcional/readProducto"})
public class readProductoServlet extends HttpServlet {

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
    
    int idProducto = Integer.parseInt(request.getParameter("idProducto"));
    
    List<productoEntity> producto = prodRepo.read(idProducto);
    base.desconectar();
    
    request.setAttribute("productos", producto);
    RequestDispatcher dispatcher = request.getRequestDispatcher("/displayProducto.jsp");
    dispatcher.forward(request, response);
    
    }
}

