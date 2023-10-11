%método Gaussiano

clear all
clc

%matriz a resolver
X =[0 2 3 5 7
    1 5 6 6 10
    0 8 9 8 5
    5 8 4 1 2]    
    
[fila colu]=size(X);

%Obtener ceros abajo de la diagonal
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
    X(j,:)= X(j,:) - X(i,:)*X(j,i)/X(i,i);
  end
  
end

%eliminación hacia atras
for j = colu-1:-1:1
  for i = j-1:-1:1
    X(i,:) = X(i,:) - X(j,:)*X(i,j)/X(j,j);
  end
end

%Obtener diagonal ceros
for i = 1:fila
  X(i,:)=X(i,:)/X(i,i);
endfor

X

%comparar con octave
rref(X)