import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
public class ChangeColorGui extends JFrame implements ActionListener{
    private Container pane;
    private JButton button;
    private VideoGui a;
    private Color col;
    public ChangeColorGui(VideoGui x) {             //Modified code
	pane = getContentPane();                    //From Amit's last semester
	button = new JButton("Select Color!");      //Final Project
	button.addActionListener(this);
	pane.add(button);
	setSize(300,300);
	setVisible(true);
	setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	a = x;
    }
    
    public void actionPerformed(ActionEvent e) {
	Color initial = Color.BLACK;
	Color newCol = JColorChooser.showDialog(this,"Choose a Color",initial);
	//Color newC = a.getColor();
	//System.out.println(newC);
	col = newCol;
        a.setColor(newCol);
    }
    public Color newCol() {
	return col;
    }
    //public void stateChanged(ChangeEvent e) {
    //	Color newColor = a.
    //}
}
