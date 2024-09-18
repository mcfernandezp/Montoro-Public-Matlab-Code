Title: Mathematical modeling for pectin extraction in melon waste.

Authors: M. Laura Montoro (ORCID: 0000-0002-9213-8917), M. Nadia Pantano (ORCID: 0000-0003-2549-6535), Cecilia Fernández (ORCID: 0000-0002-9311-1556), M. Fabiana Sardella (ORCID: 0000-0002-9233-0722), Gustavo Scaglia (ORCID: 0000-0002-0188-0017). 

Overview: The code included in the attached .m files represents a simulation of the pectin extraction process from melon waste at three different temperatures. These are based on experimental data.

Included Files:
Pectina70.m: Provides the experiment at 70°C.
Pectina80.m: Provides the experiment at 80°C.
Pectina90.m: Provides the experiment at 90°C. 

Usage Instructions: Each file can be run independently and includes detailed comments to guide the user in implementing and customizing the code. 

For example, in the file Pectina70.m:
Line 11: ganancia1 represents the value where the first step of the curve tends to settle.
Line 12: In the expression Ti,j, this is the time constant that represents the rise of the first step of the curve; the smaller it is, the faster it rises.
Line 17: Tret1 indicates when the second step of the curve begins.
Line 21: Tretardo2 indicates when the first step ends and the second step begins.
Line 22: ganancia2 regulates the slope of the final line.
Line 23: Tij is the time constant that defines the rounding of the second step.
Line 23: Tret2 indicates when the third step begins.
Line 34: Tretardo3 indicates when the second step ends and the third step begins.
Line 35: ganancia3 regulates the slope of the final line in the third step.
Line 36: Tij is the time constant that defines the rounding of the third step.

For Pectina80.m:
Line 14: ganancia1 represents the value where the first step of the curve tends to settle.
Line 15: In the expression Ti,j, this is the time constant that represents the rise of the first step of the curve; the smaller it is, the faster it rises.
Line 20: Tret1 indicates when the second step of the curve begins.
Line 24: Tretardo2 indicates when the first step ends and the second step begins.
Line 25: ganancia2 regulates the slope of the final line.
Line 26: Tij is the time constant that defines the rounding of the second step.
Line 33: Tret2 indicates when the third step begins.
Line 37: Tretardo3 indicates when the second step ends and the third step begins.
Line 38: ganancia3 regulates the slope of the final line in the third step.
Line 39: Tij is the time constant that defines the rounding of the third step.

For Pectina90.m:
Line 17: ganancia1 represents the value where the first step of the curve tends to settle.
Line 18: In the expression Ti,j, this is the time constant that represents the rise of the first step of the curve; the smaller it is, the faster it rises.
Line 23: Tret1 indicates when the second step of the curve begins.
Line 27: Tretardo2 indicates when the first step ends and the second step begins.
Line 28: ganancia2 regulates the slope of the final line.
Line 29: Tij is the time constant that defines the rounding of the second step.
Line 36: Tret2 indicates when the third step begins.
Line 40: Tretardo3 indicates when the second step ends and the third step begins.
Line 41: ganancia3 regulates the slope of the final line in the third step.
Line 42: Tij is the time constant that defines the rounding of the third step.

Contact: For any inquiries, please contact mmontoro@unsj.edu.ar.
