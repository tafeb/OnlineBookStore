/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dispatchers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Book;
import model.CartItem;

/**
 *
 * @author BR
 */
public class AddToCartDispatcher implements IDispatcher 
{
    public String execute(HttpServletRequest request)
    {
        HttpSession session = request.getSession(true);
        String nextPage = "";
        nextPage = "/jsp/titles.jsp";

        Map cart = (Map) session.getAttribute("cart");
        String[] selectedBooks = request.getParameterValues("add");

        if (cart == null) 
        {
            cart = new HashMap();
            for (int i = 0; i < selectedBooks.length; i++) 
            {
                String isbn = selectedBooks[i];
                int quantity = Integer.parseInt(request.getParameter(isbn));
                Book book = this.getBookFromList(isbn, session);
                CartItem item = new CartItem(book);
                item.setQuantity(quantity);
                cart.put(isbn, item);
            }
            session.setAttribute("cart", cart);
        } 
        else 
        {
            for (int i = 0; i < selectedBooks.length; i++) 
            {
                String isbn = selectedBooks[i];
                int quantity = Integer.parseInt(request.getParameter(isbn));
                if (cart.containsKey(isbn)) {
                CartItem item = (CartItem) cart.get(isbn);
                item.setQuantity(quantity);
            }
            else 
            {
                Book book = this.getBookFromList(isbn, session); //Changed Books to Book
                CartItem item = new CartItem(book);
                item.setQuantity(quantity);
                cart.put(isbn, item);
                }
            }
        }
//        this.dispatch(request, response, nextPage);
        return nextPage;
    }
    
    private Book getBookFromList(String isbn, HttpSession session) 
    {
        List list = (List) session.getAttribute("books");
        Book aBook = null;
        for (int i = 0; i < list.size(); i++) 
        {
            aBook = (Book) list.get(i);
            if (isbn.equals(aBook.getIsbn())) 
            {
                break;
            }
        }
        return aBook;
    }
}