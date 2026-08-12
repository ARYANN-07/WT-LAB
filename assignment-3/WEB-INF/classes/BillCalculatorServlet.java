import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BillCalculatorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String unitsParam = request.getParameter("units");

        try {
            double units = Double.parseDouble(unitsParam);
            double totalBill = ElectricityBillCalculator.calculateBill(units);
            String breakdown = ElectricityBillCalculator.getBreakdown(units);

            request.setAttribute("units", units);
            request.setAttribute("totalBill", totalBill);
            request.setAttribute("breakdown", breakdown);
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Please enter a valid number of units.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
