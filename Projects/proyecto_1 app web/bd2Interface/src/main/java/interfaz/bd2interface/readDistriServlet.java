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

import entities.distribuidorEntity;
import repositories.distribuidorRepository;

@WebServlet(name = "readDistriServlet", urlPatterns = {"/funcional/readDistri"})
public class readDistriServlet extends HttpServlet {

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
    
    int idDistribuidor = Integer.parseInt(request.getParameter("idDis"));
    
    List<distribuidorEntity> distribuidor = disRepo.read(idDistribuidor);
    base.desconectar();
    
    request.setAttribute("distribuidor", distribuidor);
    RequestDispatcher dispatcher = request.getRequestDispatcher("/displayDistribuidor.jsp");
    dispatcher.forward(request, response);
    
    }
}

