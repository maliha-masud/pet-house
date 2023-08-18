% clear the Command Window before each first run
clc;

% display name of software house
disp('Homes For Pets')

% display what program does to the user for each first run
fprintf('\n')
disp('This program will take length and width of a cardboard and return the optimal')
disp('dimensions that maximize volume of a box made from the cardboard')

while(1) % loop to keep program running until user ends it
    
    %clear workspace variables before each first run.
    clear;
    
    % display message to press any key to continue.
    % wait until user enters a key
    fprintf('\n')
    disp('Press any key to continue---')
    pause() 
    
    % declare required variables
    syms length;
    syms width;
    syms domain;
    syms x;
    
    % prompt user for values of length and width
    % store values in appropriate variables
    fprintf('\n')
    length = input('Enter the length of your cardboard piece in inches: ');
    width = input('Enter the width of your cardboard piece in inches: ');
    
    % find upper bound of domain of x by dividing shorter side by 2
    if length > width
    	domain = (width/2);
    else	% length is less than or equal to width
    	domain = (length/2); 
    end
    
    % OPTIMIZATION METHOD
    
    % define function V in terms of x, with user input values used
    V = (length-(2.*x)).*(width-(2.*x)).*(x);
    
    % calculate derivative of function V with respect to x
    Vx = diff(V,x);
    
    % solve for one critical value of derivative of V
    x = eval(solve(Vx,x,"PrincipalValue",true));
    
    % calculate numeric value of V using value of x found above
    V = (length-(2.*x)).*(width-(2.*x)).*(x);
    
    % END OF OPTIMIZATION METHOD
    
    % display results
    
    % display dimensions of the box
    fprintf('\n')
    disp('RESULTS')
    fprintf('\n')
    disp('Dimensions of box: ')
    disp([num2str(length) ' inches by ' num2str(width) ' inches by ' num2str(x,4) ' inches'])
    
    % display maximum volume upto 7 significant figures
    fprintf('\n')
    disp(['Maximum volume = ' num2str(V,7) ' inches^3'])
    fprintf('\n')
    
    % ask user if they wish to run program again or terminate it.
    % display termination message if No chosen
    % otherwise go back to start of while loop to run program again.
    choice = menu('Do you want to run the program again?','Yes','No');
    if choice==2
        disp('Program has been terminated.')
        break;
    end

end % end of while loop