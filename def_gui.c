#include <gtk/gtk.h>
#include "png_gradient.h"


static void
print_end_message (GtkWidget *widget,
		   gpointer   data)
{

  g_print ("Galaxy has been generated!\n");
}

static void
activate (GtkApplication *app,
          gpointer        user_data)
{
  GtkWidget *window;
  GtkWidget *grid;
  //GtkWidget *image;
  GdkPixbuf* pixbuf;
  GtkWidget* logo;
  GtkWidget *button;
  GtkWidget *button_box;

  window = gtk_application_window_new (app);
  gtk_window_set_title (GTK_WINDOW (window), "8-Bit Bang");
  gtk_window_set_default_size (GTK_WINDOW (window), 200, 200);

  grid = gtk_grid_new ();
  gtk_container_add (GTK_CONTAINER (window), grid);

  pixbuf = gdk_pixbuf_new_from_inline (-1, app_logo, FALSE, NULL);
  //image = gtk_image_new_from_file ("png_gradient.png");
  logo = gtk_image_new_from_pixbuf(pixbuf);
  //gtk_container_add (GTK_CONTAINER (window), image);

  button_box = gtk_button_box_new (GTK_ORIENTATION_HORIZONTAL);
  //gtk_container_add (GTK_CONTAINER (window), button_box);

  button = gtk_button_new_with_label ("Generate Galaxy!");
  g_signal_connect (button, "clicked", G_CALLBACK (print_end_message), NULL);
  g_signal_connect_swapped (button, "clicked", G_CALLBACK (gtk_widget_destroy), window);
  gtk_container_add (GTK_CONTAINER (button_box), button);

  gtk_grid_attach (GTK_GRID (grid), logo, 0, 0, 1, 1);
  gtk_grid_attach (GTK_GRID (grid), button_box, 0, 1, 2, 1);

  gtk_widget_show_all (window);
}

int
main (int    argc,
      char **argv)
{
  GtkApplication *app;
  int status;

  app = gtk_application_new ("org.gtk.example", G_APPLICATION_FLAGS_NONE);
  g_signal_connect (app, "activate", G_CALLBACK (activate), NULL);
  status = g_application_run (G_APPLICATION (app), argc, argv);
  g_object_unref (app);

  return status;
}
