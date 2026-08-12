public class ElectricityBillCalculator {

    public static double calculateBill(double units) {
        if (units < 0) {
            throw new IllegalArgumentException("Units cannot be negative.");
        }

        double total = 0.0;
        double remaining = units;

        if (remaining > 0) {
            double slabUnits = Math.min(remaining, 50);
            total += slabUnits * 3.50;
            remaining -= slabUnits;
        }

        if (remaining > 0) {
            double slabUnits = Math.min(remaining, 100);
            total += slabUnits * 4.00;
            remaining -= slabUnits;
        }

        if (remaining > 0) {
            double slabUnits = Math.min(remaining, 100);
            total += slabUnits * 5.20;
            remaining -= slabUnits;
        }

        if (remaining > 0) {
            total += remaining * 6.50;
        }

        return Math.round(total * 100.0) / 100.0;
    }

    public static String getBreakdown(double units) {
        double remaining = units;
        StringBuilder breakdown = new StringBuilder();

        if (remaining > 0) {
            double slabUnits = Math.min(remaining, 50);
            breakdown.append("First 50 units: ").append(String.format("%.2f", slabUnits)).append(" units @ ₹3.50 = ₹")
                    .append(String.format("%.2f", slabUnits * 3.50)).append("<br>");
            remaining -= slabUnits;
        }

        if (remaining > 0) {
            double slabUnits = Math.min(remaining, 100);
            breakdown.append("Next 100 units: ").append(String.format("%.2f", slabUnits)).append(" units @ ₹4.00 = ₹")
                    .append(String.format("%.2f", slabUnits * 4.00)).append("<br>");
            remaining -= slabUnits;
        }

        if (remaining > 0) {
            double slabUnits = Math.min(remaining, 100);
            breakdown.append("Next 100 units: ").append(String.format("%.2f", slabUnits)).append(" units @ ₹5.20 = ₹")
                    .append(String.format("%.2f", slabUnits * 5.20)).append("<br>");
            remaining -= slabUnits;
        }

        if (remaining > 0) {
            breakdown.append("Above 250 units: ").append(String.format("%.2f", remaining)).append(" units @ ₹6.50 = ₹")
                    .append(String.format("%.2f", remaining * 6.50)).append("<br>");
        }

        return breakdown.toString();
    }
}
