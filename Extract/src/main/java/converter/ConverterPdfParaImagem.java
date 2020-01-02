/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package converter;

import java.awt.Image;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import net.sourceforge.tess4j.util.PdfBoxUtilities;

/**
 *
 * @author josu_
 */
public class ConverterPdfParaImagem {

    public static ImageIcon converter(File pdf) {
        try {
            File[] imagensEmPng = PdfBoxUtilities.convertPdf2Png(pdf);
            Image imagem = ImageIO.read(imagensEmPng[0]);
            return new ImageIcon(imagem);
        } catch (IOException ex) {
            Logger.getLogger(ConverterPdfParaImagem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
