package supernova.pfe.tool;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

public class ImageResizer {

    public static String msg = null;
    public static String newFilePath = null;

    public static File init(File orignalImage, int width, int height, String extension) {
        try {
            BufferedImage origBuffImg = ImageIO.read(orignalImage);
            if (origBuffImg.getHeight() > height || origBuffImg.getWidth() > width) {
                int type = origBuffImg.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : origBuffImg.getType();
                BufferedImage resizedBuffImg = new BufferedImage(width, height, type);
                Graphics2D g = resizedBuffImg.createGraphics();
                g.drawImage(origBuffImg, 0, 0, width, height, null);
                g.dispose();
                String oldpath = orignalImage.getAbsolutePath();
                ImageResizer.newFilePath = oldpath.substring(0, oldpath.lastIndexOf(".")) + "." + extension;
                ImageIO.write(resizedBuffImg, extension, new File(ImageResizer.newFilePath));
            }
        } catch (IOException e) {
            msg = e.getMessage();
        }
        return new File(ImageResizer.newFilePath);
    }
}
