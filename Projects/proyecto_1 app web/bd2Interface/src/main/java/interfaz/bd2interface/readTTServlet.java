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

import entities.TTEntity;
import repositories.TTRepository;


@WebServlet(name = "readTTServlet", urlPatterns = {"/funcional/readTT"})
public class readTTServlet extends HttpServlet {

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
    
    int idProducto = Integer.parseInt(request.getParameter("idProducto"));
    
    List<TTEntity> transaccion = TTRepo.read(idProducto);
    base.desconectar();
    
    request.setAttribute("transaccion", transaccion);
    RequestDispatcher dispatcher = request.getRequestDispatcher("/displayTT.jsp");
    dispatcher.forward(request, response);
    
    }
}


