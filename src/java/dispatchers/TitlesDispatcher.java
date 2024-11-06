/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dispatchers;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utility.AdmitBookStoreDAO;

/**
 *
 * @author BR
 */
public class TitlesDispatcher implements IDispatcher 
{
    public String execute(HttpServletRequest request) 
    {     
        HttpSession session = request.getSession(true);
        AdmitBookStoreDAO dao = new AdmitBookStoreDAO();
        
        List books = null;
        String nextPage = "/jsp/error.jsp";
        session = request.getSession();
        try 
        {
            books = dao.getAllBooks();
            session.setAttribute("books", books); //Books changed to books
            nextPage = "/jsp/titles.jsp";

        } 
        catch (Exception ex) 
        {
            request.setAttribute("result", ex.getMessage());
            nextPage = "/jsp/error.jsp";
        } 
        return nextPage;
    }   
}
