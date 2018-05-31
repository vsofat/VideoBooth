import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
public class VideoGui extends JFrame implements ActionListener{
    //private Capture video;
    private JPanel modPane;
    private JPanel videoPane;
    private JPanel capturePane;
    private Container pane;
    private Color color;
    private VideoGui z = null;

    public VideoGui() {
	this.setTitle("Amit and Jeremy's Video Editor");
	this.setSize(650,650);
	this.setLocation(300,0);
	this.setDefaultCloseOperation(EXIT_ON_CLOSE);
	this.setResizable(false);

	pane = new JPanel(new BorderLayout());
	videoPane = new JPanel(new BorderLayout());
        modPane = new JPanel(new GridLayout(5,1));
	capturePane = new JPanel(new GridLayout(1, 2));
	pane.add(videoPane, BorderLayout.CENTER);
	pane.add(modPane, BorderLayout.EAST);
	pane.add(capturePane, BorderLayout.SOUTH);
	this.getContentPane().add(pane);

	Font font = new Font("PT Sans",Font.BOLD, 20);
	modPane.setFont(font);
	JButton invertH = new JButton("Invert Horizontally");
        invertH.addActionListener(this);
	modPane.add(invertH);
	JButton invertV = new JButton("Invert Vertically");
        invertV.addActionListener(this);
	modPane.add(invertV);
	JButton tint = new JButton("Tint");
	tint.addActionListener(this);
	modPane.add(tint);
	JButton grayscale = new JButton("Grayscale");
	grayscale.addActionListener(this);
	modPane.add(grayscale);
	JButton sticker = new JButton("Sticker");
	sticker.addActionListener(this);
	modPane.add(sticker);
	JButton video = new JButton("Record");
	JButton picture = new JButton("Take Picture");
	video.addActionListener(this);
	picture.addActionListener(this);
	capturePane.add(video);
	capturePane.add(picture);
    }
    public void actionPerformed(ActionEvent e) {
	String s = e.getActionCommand();
	if (s.equals("Tint")) {
	    //System.out.println("woo");
	    ChangeColorGui col = new ChangeColorGui(z);
	    col.setVisible(true);
	    System.out.println(getColor());
	}
	
    }
    public void setColor(Color newColor) {
	color = newColor;
    }
    public Color getColor() {
	return color;
    }
    public static void main(String[] args) {
	VideoGui a = new VideoGui();
	a.setVisible(true);
    }
}
