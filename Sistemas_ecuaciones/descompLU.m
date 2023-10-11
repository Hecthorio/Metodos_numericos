%descomposición LU

clear all
clc

%matriz a resolver
X =[2 2 3 5 7
    1 5 6 6 10
    3 8 9 8 5
    5 8 4 1 2]    
    
[fila colu]=size(X);

%Obtener ceros abajo de la diagonal U
for i = 1:colu-1
  %seleccionar fila pivoteo (una fila que no tenga cero)
  if X(i,i) == 0
    for j = i+1:fila
      if X(j,i)>0
        a = X(i,:);
        X(i,:) = X(j,i);
        X(j,:) = a;
        break
      end
    end
  end
  
  for j = i+1:fila
    b(j,i)=X(j,i)/X(i,i); %valores para obtener L
    X(j,:)= X(j,:) - X(i,:)*X(j,i)/X(i,i);
  end

end

U = X(:,1:colu-1);
L = b;

for i = 1:colu-1
  L(i,i)=1;
endfor

L*U