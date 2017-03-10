import org.eclipse.jface.dialogs.MessageDialog;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;
import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Button;
import org.eclipse.wb.swt.SWTResourceManager;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;

// Author		  : Sandeep Lanka
// Date  		  : Feb 10, 2016
// OS    		  : Mac OSx Sierra
// JDK Compliance : 1.8
// IDE   		  : Eclipse Luna 
// Jar generated  : YES
// Purpose		  : Not Academic
// Project		  : Non Specified
public class UI {

	protected Shell shell;
	private Text Op1Str;
	private Text Op2Str;
	private Button PlusButton;
	private Button MinusButton;
	private Text ResultStr;
	private Label lblResult;
	private Button Mul;
	private Button btnNewButton_1;
	private Button Power;
	private Button OR;
	private Button AND;
	private Button XOR;
	private Button btnToBinary;
	private Button btnToDecimal;

	/**
	 * Launch the application.
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			UI window = new UI();
			window.open();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Open the window.
	 */
	public void open() {
		Display display = Display.getDefault();
		createContents();
		shell.open();
		shell.layout();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch()) {
				display.sleep();
			}
		}
	}
	// Author		: Sandeep Lanka

	/**
	 * Create contents of the window.
	 */
	protected void createContents() {
		shell = new Shell();
		shell.setSize(450, 300);
		shell.setText("Calculator © SL");
		
		Op1Str = new Text(shell, SWT.BORDER);
		Op1Str.setBounds(29, 38, 111, 19);
		
		Op2Str = new Text(shell, SWT.BORDER);
		Op2Str.setBounds(29, 101, 111, 19);
		
		Label Op1 = new Label(shell, SWT.NONE);
		Op1.setBounds(29, 20, 78, 19);
		Op1.setText("Operand 1");
		
		Label Op2 = new Label(shell, SWT.NONE);
		Op2.setBounds(29, 81, 94, 19);
		Op2.setText("Operand 2");
		
		lblResult = new Label(shell, SWT.NONE);
		lblResult.setFont(SWTResourceManager.getFont(".SF NS Text", 17, SWT.NORMAL));
		lblResult.setBounds(29, 169, 59, 28);
		lblResult.setText("Result");

		// Author		: Sandeep Lanka

		PlusButton = new Button(shell, SWT.NONE);
		PlusButton.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				float number1 = 0, number2 = 0;
				try{
					 number1 = Float.parseFloat(Op1Str.getText());
					}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","Type an Number for Op1");
					
				}
				
				try{
					 number2 = Float.parseFloat(Op2Str.getText());
					}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","Type an Number for Op2");
					
				}	
				float answer = number1 + number2;
				ResultStr.setText(String.valueOf(answer));

			}
		});
		PlusButton.setBounds(232, 34, 94, 28);
		PlusButton.setText("+");
		
		MinusButton = new Button(shell, SWT.NONE);
		MinusButton.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				float number1 = 0, number2 = 0;
				try{
					 number1 = Float.parseFloat(Op1Str.getText());
					}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","Type an Number for Op1");
					
				}
				
				try{
					 number2 = Float.parseFloat(Op2Str.getText());
					}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","Type an Number for Op2");
					
				}	
				float answer = number1 - number2;
				ResultStr.setText(String.valueOf(answer));
				// Author		: Sandeep Lanka

			}
		});
		MinusButton.setBounds(346, 34, 94, 28);
		MinusButton.setText("-");
		
		ResultStr = new Text(shell, SWT.BORDER);
		ResultStr.setBounds(29, 203, 146, 19);
		
		Mul = new Button(shell, SWT.NONE);
		Mul.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				float number1 = 0, number2 = 0;
				try{
					 number1 = Float.parseFloat(Op1Str.getText());
					}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","Type an Number for Op1");
					
				}
				
				try{
					 number2 = Float.parseFloat(Op2Str.getText());
					}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","Type an Number for Op2");
					
				}	
				float answer = number1 * number2;
				ResultStr.setText(String.valueOf(answer));

			}
		});
		Mul.setBounds(232, 74, 94, 28);
		Mul.setText("*");
		
		btnNewButton_1 = new Button(shell, SWT.NONE);
		btnNewButton_1.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				float number1 = 0, number2 = 0;
				try{
					 number1 = Float.parseFloat(Op1Str.getText());
					}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","Type an Number for Op1");
					
				}
				
				try{
					 number2 = Float.parseFloat(Op2Str.getText());
					}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","Type an Number for Op2");
					
				}	
				float answer = number1 / number2;
				ResultStr.setText(String.valueOf(answer));
				// Author		: Sandeep Lanka

			}
		});
		btnNewButton_1.setBounds(346, 74, 94, 28);
		btnNewButton_1.setText("/");
		
		Power = new Button(shell, SWT.NONE);
		Power.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				float number1 = 0, number2 = 0;
				try{
					 number1 = Float.parseFloat(Op1Str.getText());
					}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","Type an Number for Op1");
					
				}
				
				try{
					 number2 = Float.parseFloat(Op2Str.getText());
					}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","Type an Number for Op2");
					
				}	
				double answer = Math.pow(number1,number2);
				ResultStr.setText(String.valueOf(answer));

			}
		});
		Power.setBounds(232, 121, 94, 28);
		Power.setText("Power");
		
		OR = new Button(shell, SWT.NONE);
		OR.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				int number1 = 0, number2 = 0;
				try{
					 number1 = Integer.parseInt(Op1Str.getText());
					}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","Type an Number for Op1");
					
				}
				
				try{
					 number2 = Integer.parseInt(Op2Str.getText());
					}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","Type an Number for Op2");
					
				}	
				String num1 = Integer.toBinaryString(number1);
				String num2 = Integer.toBinaryString(number2);
				int answer =  Integer.parseInt(num1) | Integer.parseInt(num2);
				ResultStr.setText(String.valueOf(answer));

			}
		});
		OR.setBounds(346, 121, 94, 28);
		OR.setText("OR");
		
		AND = new Button(shell, SWT.NONE);
		AND.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				int number1 = 0, number2 = 0;
				try{
					 number1 = Integer.parseInt(Op1Str.getText());
					}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","Type an Number for Op1");
					
				}
				
				try{
					 number2 = Integer.parseInt(Op2Str.getText());
					}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","Type an Number for Op2");
					
				}	
				String num1 = Integer.toBinaryString(number1);
				String num2 = Integer.toBinaryString(number2);
				int answer =  Integer.parseInt(num1) & Integer.parseInt(num2);
				ResultStr.setText(String.valueOf(answer));

			}
		});
		AND.setBounds(232, 168, 94, 28);
		AND.setText("AND");
		
		XOR = new Button(shell, SWT.NONE);
		XOR.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				int number1 = 0, number2 = 0;
				try{
					 number1 = Integer.parseInt(Op1Str.getText());
					}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","Type an Number for Op1");
					
				}
				
				try{
					 number2 = Integer.parseInt(Op2Str.getText());
					}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","Type an Number for Op2");
					
				}	
				String num1 = Integer.toBinaryString(number1);
				String num2 = Integer.toBinaryString(number2);
				int answer =  Integer.parseInt(num1) ^ Integer.parseInt(num2);
				ResultStr.setText(String.valueOf(answer));
			}
		});
		XOR.setBounds(346, 168, 94, 28);
		XOR.setText("XOR");
		
		btnToBinary = new Button(shell, SWT.NONE);
		btnToBinary.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				try{
				String num1 = Integer.toBinaryString(Integer.parseInt(ResultStr.getText()));
				ResultStr.setText(String.valueOf(num1));
				}
		
				catch (Exception exc)
					{
						MessageDialog.openError(shell,"Error","There is no value in the Result Box");
						
					}	
			}
			
		});
		btnToBinary.setBounds(232, 215, 94, 28);
		btnToBinary.setText("To Binary");
		
		btnToDecimal = new Button(shell, SWT.NONE);
		btnToDecimal.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
				try{
				int num1 = Integer.parseInt(ResultStr.getText(),2);
				ResultStr.setText(String.valueOf(num1));
				}
				catch (Exception exc)
				{
					MessageDialog.openError(shell,"Error","1.There is no value in the Result Box \nOR \n2.the Number is Not Binary");
					
				}	
			}
		});
		btnToDecimal.setBounds(346, 215, 94, 28);
		btnToDecimal.setText("To Decimal");
		// Author		: Sandeep Lanka
	

	}
}
