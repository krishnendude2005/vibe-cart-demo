import { ShoppingCart } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Product } from '@/types';
import { useCart } from '@/hooks/useCart';

interface ProductCardProps {
  product: Product;
}

const productImages: Record<string, string> = {
  'Wireless Headphones': new URL('../assets/headphones.jpg', import.meta.url).href,
  'Smart Watch': new URL('../assets/smartwatch.jpg', import.meta.url).href,
  'Laptop Stand': new URL('../assets/laptop-stand.jpg', import.meta.url).href,
  'Mechanical Keyboard': new URL('../assets/keyboard.jpg', import.meta.url).href,
  'USB-C Hub': new URL('../assets/usb-hub.jpg', import.meta.url).href,
  'Portable SSD': new URL('../assets/ssd.jpg', import.meta.url).href,
  'Webcam HD': new URL('../assets/webcam.jpg', import.meta.url).href,
  'Wireless Mouse': new URL('../assets/mouse.jpg', import.meta.url).href,
};

const ProductCard = ({ product }: ProductCardProps) => {
  const { addToCart } = useCart();
  const imageUrl = productImages[product.name] || product.image_url || '/placeholder.svg';

  return (
    <Card className="h-full flex flex-col transition-all duration-300 hover:shadow-hover group">
      <CardHeader className="p-0">
        <div className="relative overflow-hidden rounded-t-lg bg-muted aspect-[4/3]">
          <img
            src={imageUrl}
            alt={product.name}
            className="w-full h-full object-cover transition-transform duration-300 group-hover:scale-105"
          />
          {product.stock > 0 && (
            <Badge className="absolute top-3 right-3 bg-success hover:bg-success">
              In Stock
            </Badge>
          )}
        </div>
      </CardHeader>
      
      <CardContent className="flex-1 pt-4">
        <CardTitle className="mb-2 text-xl">{product.name}</CardTitle>
        <CardDescription className="mb-4 line-clamp-2">
          {product.description || 'No description available'}
        </CardDescription>
        <div className="flex items-baseline gap-2">
          <span className="text-3xl font-bold text-primary">
            ${product.price.toFixed(2)}
          </span>
        </div>
      </CardContent>

      <CardFooter className="pt-0">
        <Button 
          className="w-full transition-all duration-200"
          onClick={() => addToCart(product)}
          disabled={product.stock === 0}
        >
          <ShoppingCart className="mr-2 h-4 w-4" />
          {product.stock === 0 ? 'Out of Stock' : 'Add to Cart'}
        </Button>
      </CardFooter>
    </Card>
  );
};

export default ProductCard;
