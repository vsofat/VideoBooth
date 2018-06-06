import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
public class VideoGui extends JFrame implements ActionListener{
    //private Capture video;
    private JPanel modPane;
    private JPanel capturePane;
    private Container pane;
    private Color color;
    private VideoGui z = null;
    private PApplet videoPane;

    public VideoGui() {
	this.setTitle("Amit and Jeremy's Video Editor");
	this.setSize(500,500);
	this.setLocation(400,150);
	this.setDefaultCloseOperation(EXIT_ON_CLOSE);
	this.setResizable(true);

	pane = new JPanel(new BorderLayout());
	videoPane = new Video();
        modPane = new JPanel(new GridLayout(5,1));
	capturePane = new JPanel(new GridLayout(2, 2));
	pane.add(videoPane, BorderLayout.CENTER);
	pane.add(modPane, BorderLayout.EAST);
	pane.add(capturePane, BorderLayout.SOUTH);
	this.getContentPane().add(pane);

	Font font = new Font("OPEN SANS",Font.BOLD, 15);
	modPane.setFont(font);
	capturePane.setFont(font);
	JButton invertH = new JButton("Invert Horizontally");
	invertH.setFont(font);
        invertH.addActionListener(this);
	modPane.add(invertH);
	JButton invertV = new JButton("Invert Vertically");
	invertV.setFont(font);
        invertV.addActionListener(this);
	modPane.add(invertV);
	JButton tint = new JButton("Tint");
	tint.setFont(font);
	tint.addActionListener(this);
	modPane.add(tint);
	JButton grayscale = new JButton("Grayscale");
	grayscale.setFont(font);
	grayscale.addActionListener(this);
	modPane.add(grayscale);
	JButton sticker = new JButton("Sticker");
	sticker.setFont(font);
	sticker.addActionListener(this);
	modPane.add(sticker);
	JButton video = new JButton("Record");
	video.setFont(font);
	video.setForeground(Color.red);
	JButton picture = new JButton("Take Picture");
	picture.setFont(font);
	picture.setForeground(Color.red);
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
	if (s.equals("Invert Horizontally") ||
	    s.equals("Invert Vertically")) {
	    Invert i = new Invert();
	    
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
