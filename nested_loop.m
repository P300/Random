AA=magic(4)
num_row=size(AA,1);
num_col=size(AA,2);
for i=1:1:num_row
    for j=1:1:num_col
          if mod(AA(i,j),2)==0
    fprintf('%0.0f is even.\n',AA(i,j))
    else
              fprintf('%0.0f is odd.\n',AA(i,j))
          end
    end 
end 
    
