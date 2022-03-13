function make_phase_plot(dy, x, plot_title)
    figure('Name', plot_title);
    x = dy(1, :);
    y = dy(2, :);
    z = dy(3, :);
    plot3(x(1), x(2), x(3), 'x')
    hold on
    plot3(x, y, z, 'LineWidth', 1)
%     plot3(x(1), y(1), z(1), 'b.','MarkerSize', 20) 
    axis equal; 
    xlabel('x');
    ylabel('y');
    zlabel('z');
end