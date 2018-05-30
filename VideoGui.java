import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
public class VideoGui extends JFrame implements ActionListener{
    //private Capture video;
    private JPanel modPane;
    private JPanel videoPane;
    private JPanel capturePane;
    private JPanel pane;

    public VideoGui() {
	this.setTitle("Amit and Jeremy's Video Editor");
	this.setSize(650,650);
	this.setLocation(300,0);
	this.setDefaultCloseOperation(EXIT_ON_CLOSE);
	this.setResizable(false);

	pane = new JPanel(new BorderLayout());
	videoPane = new JPanel(new BorderLayout());
        modPane = new JPanel(new GridLayout(5,1));
	capturePane = new JPanel(new GridLayout(1, 11));
	pane.add(videoPane, BorderLayout.CENTER);
	pane.add(modPane, BorderLayout.EAST);
	pane.add(capturePane, BorderLayout.SOUTH);
	this.getContentPane().add(pane);

	Font font = new Font("PT Sans",Font.BOLD, 20);
	modPane.setFont(font);
	JButton invertH = new JButton("Invert Horizontally");
	modPane.add(invertH);
	JButton invertV = new JButton("Invert Vertically");
	modPane.add(invertV);
	JButton tint = new JButton("Tint");
	modPane.add(tint);
	JButton grayscale = new JButton("Grayscale");
	modPane.add(grayscale);
	JButton sticker = new JButton("Sticker");
	modPane.add(sticker);
    }
    public void actionPerformed(ActionEvent e) {
	String s = e.getActionCommand();
	
    }
    public static void main(String[] args) {
	VideoGui a = new VideoGui();
	a.setVisible(true);
    }
}
