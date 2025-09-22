module mem-ctlr(p1,p2,p3,p4,p5,q1,q2,q3,q4,q5,q6);
input p1,p2,p3,p4,p5;
output q1,q2,q3,q4,q5,q6;

//connection by position 
addr_gen u0(p1,p2,n3,q1,n1,n2);
data_gen u1(p3,p4,n3,q6,n4);
timing_ctrl u2(n1,n2,n4,p5,q2,q4,q3,q5);

//connection by name
addr_gen u0(.i1(p1),.i2(p2),.i3(n3),.o1(q1),.o2(n1),.o3(n2));
data_gen u1(.i1(p3),.i2(p4),.o1(n3),.o2(q6),.o3(n4));
timing_ctrl u2(.i1(n1),.i2(n2),.i3(n4),.i4(p5),.o1(q2),.o2(q4),.o3(q3),.o4(q5));

endmodule
