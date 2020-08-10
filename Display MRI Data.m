%%%%%% Display MRI Data %%%%%%%%



% The first step is to load the data and transform the data array from 4-D to 3-D.
load mri
D = squeeze(D);

% To display one of the MRI images, use the image command
figure
colormap(map)
image_num = 8;
image(D(:,:,image_num))
axis image

% Save the x-and y-axis limits for use in the next part of the example
x = xlim;
y = ylim;

% Displaying a 2-D Contour Slice
cm = brighten(jet(length(map)),-.5);
figure
colormap(cm)
contourslice(D,[],[],image_num)
axis ij
xlim(x)
ylim(y)
daspect([1,1,1])

% Displaying 3-D Contour Slices
figure
colormap(cm)
contourslice(D,[],[],[1,12,19,27],8);
view(3);
axis tight

% Applying an Isosurface to the MRI Data
figure
colormap(map)
Ds = smooth3(D);
hiso = patch(isosurface(Ds,5),...
'FaceColor',[1,.75,.65],...
'EdgeColor','none');
isonormals(Ds,hiso)

% Adding Isocaps Show Cut-Away Surface
hcap = patch(isocaps(D,5),...
'FaceColor','interp',...
'EdgeColor','none');

% Defineing the View
view(35,30) 
axis tight 
daspect([1,1,.4])

% Add Lighting
lightangle(45,30);
lighting gouraud
hcap.AmbientStrength = 0.6;
hiso.SpecularColorReflectance = 0;
hiso.SpecularExponent = 50;
