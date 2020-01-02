import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;
import net.sourceforge.tess4j.util.PdfBoxUtilities;

import java.io.File;
import java.io.IOException;

public class Extract {

    public static void main(String[] args) {
        Tesseract ocr = new Tesseract();
        try {
            System.out.println(ocr.doOCR(PdfBoxUtilities.convertPdf2Tiff(new File("/mnt/CA84EA8A84EA7879/Fatec/hemogramas/saida.pdf"))));
        } catch (TesseractException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
