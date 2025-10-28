-- Create products table
CREATE TABLE public.products (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL,
  image_url TEXT,
  stock INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Create cart_items table
CREATE TABLE public.cart_items (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  session_id TEXT NOT NULL,
  product_id UUID NOT NULL REFERENCES public.products(id) ON DELETE CASCADE,
  quantity INTEGER NOT NULL DEFAULT 1,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Create orders table
CREATE TABLE public.orders (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  total DECIMAL(10, 2) NOT NULL,
  items JSONB NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE public.products ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cart_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.orders ENABLE ROW LEVEL SECURITY;

-- RLS Policies for products (public read access)
CREATE POLICY "Products are viewable by everyone" 
ON public.products 
FOR SELECT 
USING (true);

-- RLS Policies for cart_items (session-based access)
CREATE POLICY "Cart items are viewable by session" 
ON public.cart_items 
FOR SELECT 
USING (true);

CREATE POLICY "Cart items can be created by anyone" 
ON public.cart_items 
FOR INSERT 
WITH CHECK (true);

CREATE POLICY "Cart items can be updated by anyone" 
ON public.cart_items 
FOR UPDATE 
USING (true);

CREATE POLICY "Cart items can be deleted by anyone" 
ON public.cart_items 
FOR DELETE 
USING (true);

-- RLS Policies for orders (public write access for checkout)
CREATE POLICY "Orders can be created by anyone" 
ON public.orders 
FOR INSERT 
WITH CHECK (true);

-- Create function to update timestamps
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SET search_path = public;

-- Create trigger for automatic timestamp updates on cart_items
CREATE TRIGGER update_cart_items_updated_at
BEFORE UPDATE ON public.cart_items
FOR EACH ROW
EXECUTE FUNCTION public.update_updated_at_column();

-- Insert sample products
INSERT INTO public.products (name, description, price, image_url, stock) VALUES
  ('Wireless Headphones', 'Premium noise-canceling wireless headphones with 30-hour battery life', 149.99, '/placeholder.svg', 25),
  ('Smart Watch', 'Fitness tracking smartwatch with heart rate monitor and GPS', 299.99, '/placeholder.svg', 15),
  ('Laptop Stand', 'Ergonomic aluminum laptop stand with adjustable height', 79.99, '/placeholder.svg', 40),
  ('Mechanical Keyboard', 'RGB mechanical gaming keyboard with custom switches', 129.99, '/placeholder.svg', 30),
  ('USB-C Hub', '7-in-1 USB-C hub with HDMI, USB 3.0, and SD card reader', 49.99, '/placeholder.svg', 50),
  ('Portable SSD', '1TB portable SSD with USB-C 3.2 Gen 2 for fast transfers', 189.99, '/placeholder.svg', 20),
  ('Webcam HD', '1080p HD webcam with built-in microphone and auto-focus', 89.99, '/placeholder.svg', 35),
  ('Wireless Mouse', 'Ergonomic wireless mouse with precision tracking', 59.99, '/placeholder.svg', 45);