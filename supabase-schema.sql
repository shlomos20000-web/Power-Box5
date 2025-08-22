-- Supabase Database Schema for Dynamic Content Management
-- This script creates all the necessary tables for managing website content dynamically

-- Enable Row Level Security (RLS) and create policies for content management
-- Note: Make sure to run this in your Supabase SQL editor

-- 1. Hero Section Table
CREATE TABLE IF NOT EXISTS hero_section (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    content JSONB NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Insert default hero section data
INSERT INTO hero_section (content) VALUES (
'{
  "title": "Nutritious Snack Box with Breakfast Bars and Delicious Chips | Gift A Snack (42 Count)",
  "rating": 4.6,
  "reviews_count": 23,
  "sale_price": 31.95,
  "features": ["Fresh & high-quality snacks", "Walmart+ offer eligible"],
  "delivery_text": "Fast & reliable delivery",
  "urgency_text": "Limited stock available",
  "primary_cta": "View Product Details",
  "secondary_cta": "Learn More About This Product",
  "main_image": "https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2F79d471e5bc56457eb2c3b1c3eb6586ae?format=webp&width=800",
  "walmart_url": "https://www.walmart.com/ip/Healthy-Snack-Box-Tasty-Nutrient-Rich-Variety-42-Count-by-Gift-A-Snack/14479818419"
}'
) ON CONFLICT DO NOTHING;

-- 2. Customer Reviews Table
CREATE TABLE IF NOT EXISTS customer_reviews (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    content JSONB NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Insert default customer reviews data
INSERT INTO customer_reviews (content) VALUES (
'{
  "title": "What Our Customers Say",
  "overall_rating": 4.6,
  "total_reviews": 23,
  "reviews": [
    {
      "name": "Sarah M.",
      "rating": 5,
      "text": "Amazing variety! Perfect for our office team. Everyone loved the selection of snacks.",
      "date": "2 weeks ago",
      "verified": true
    },
    {
      "name": "Mike D.",
      "rating": 5,
      "text": "Great gift idea! Sent this to my college son and he was thrilled with all the different snacks.",
      "date": "1 month ago",
      "verified": true
    },
    {
      "name": "Lisa K.",
      "rating": 4,
      "text": "Good quality snacks and fast delivery. Would definitely order again.",
      "date": "3 weeks ago",
      "verified": true
    },
    {
      "name": "Jennifer R.",
      "rating": 5,
      "text": "Perfect for busy mornings! The breakfast bars keep me energized all day.",
      "date": "1 week ago",
      "verified": true
    },
    {
      "name": "David L.",
      "rating": 5,
      "text": "Excellent packaging and variety. My kids love these snacks for school.",
      "date": "2 weeks ago",
      "verified": true
    },
    {
      "name": "Maria G.",
      "rating": 4,
      "text": "Great value for the price. Snacks are fresh and delicious.",
      "date": "1 month ago",
      "verified": true
    }
  ]
}'
) ON CONFLICT DO NOTHING;

-- 3. SEO Settings Table
CREATE TABLE IF NOT EXISTS seo_settings (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    content JSONB NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Insert default SEO settings data
INSERT INTO seo_settings (content) VALUES (
'{
  "meta_title": "Nutritious Snack Box with Breakfast Bars and Delicious Chips | Gift A Snack (42 Count)",
  "meta_description": "Get your 42-count nutritious snack box with breakfast bars and delicious chips. Perfect for gifting, office sharing, or personal enjoyment. Fast delivery, high-quality snacks.",
  "meta_keywords": "snack box, breakfast bars, healthy snacks, gift box, nutritious snacks, office snacks, 42 count, delicious chips",
  "og_title": "Nutritious Snack Box - 42 Premium Snacks | Gift A Snack",
  "og_description": "Amazing variety of snacks! Perfect for office teams, college students, and gifts. Fresh & high-quality snacks with fast delivery.",
  "og_image": "https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2F79d471e5bc56457eb2c3b1c3eb6586ae?format=webp&width=1200",
  "canonical_url": "",
  "facebook_pixel_id": ""
}'
) ON CONFLICT DO NOTHING;

-- 4. Product Popup Table
CREATE TABLE IF NOT EXISTS product_popup (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    content JSONB NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Insert default product popup data with popup_link and popup_title
INSERT INTO product_popup (content) VALUES (
'{
  "title": "Nutritious Snack Box with Breakfast Bars and Delicious Chips | Gift A Snack (42 Count)",
  "description": "View detailed product information, pricing, and purchase options for this 42-piece snack collection.",
  "product_name": "Nutritious Snack Box - Gift A Snack",
  "rating": 4.6,
  "reviews_count": 23,
  "original_price": 42.99,
  "discounted_price": 31.95,
  "features": ["Fresh & high-quality snacks", "Walmart+ offer eligible"],
  "pieces_count": 42,
  "additional_details": [
    "Ultimate snack experience in a beautifully designed high-end packaging box",
    "Packed with a variety of breakfast bars and savory snacks for daily energy",
    "Individually packaged snacks for convenient grab-and-go options",
    "Ideal for adults, teens, and college students alike",
    "Arrives with a heartwarming greeting card for a personal touch"
  ],
  "popup_image": "https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2F79d471e5bc56457eb2c3b1c3eb6586ae?format=webp&width=800",
  "popup_link": "https://www.walmart.com/ip/Healthy-Snack-Box-Tasty-Nutrient-Rich-Variety-42-Count-by-Gift-A-Snack/14479818419",
  "popup_title": "Get Your Snack Box Now!"
}'
) ON CONFLICT DO NOTHING;

-- 5. Exit Intent Popup Table
CREATE TABLE IF NOT EXISTS exit_intent_popup (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    content JSONB NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Insert default exit intent popup data with popup_link and popup_title
INSERT INTO exit_intent_popup (content) VALUES (
'{
  "title": "Wait! Don'\''t Miss Out!",
  "description": "👉 Subscribe now to be the first to know about our upcoming exclusive offers\n\n👉 Join our mailing list and get the latest news and special deals before anyone else.",
  "email_placeholder": "👉 Enter your email here",
  "subscribe_button_text": "👉 Get Exclusive Deals",
  "dismiss_button_text": "👉 Maybe later",
  "privacy_note": "👉 🔒 We will never send you spam. You can unsubscribe anytime",
  "destination_email": "",
  "mailchimp_api_key": "",
  "mailchimp_list_id": "",
  "brevo_api_key": "",
  "brevo_list_id": "",
  "popup_link": "https://www.walmart.com/ip/Healthy-Snack-Box-Tasty-Nutrient-Rich-Variety-42-Count-by-Gift-A-Snack/14479818419",
  "popup_title": "Get Your Snack Box - Limited Time!"
}'
) ON CONFLICT DO NOTHING;

-- 6. Footer Table
CREATE TABLE IF NOT EXISTS footer (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    content JSONB NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Insert default footer data
INSERT INTO footer (content) VALUES (
'{
  "social_links": [
    {
      "name": "Facebook",
      "url": "https://facebook.com",
      "icon": "Facebook"
    },
    {
      "name": "Instagram",
      "url": "https://instagram.com",
      "icon": "Instagram"
    },
    {
      "name": "Twitter",
      "url": "https://twitter.com",
      "icon": "Twitter"
    },
    {
      "name": "YouTube",
      "url": "https://youtube.com",
      "icon": "Youtube"
    },
    {
      "name": "TikTok",
      "url": "https://tiktok.com",
      "icon": "TikTok"
    }
  ]
}'
) ON CONFLICT DO NOTHING;

-- 7. Trust Section Table
CREATE TABLE IF NOT EXISTS trust_section (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    content JSONB NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Insert default trust section data
INSERT INTO trust_section (content) VALUES (
'{
  "title": "Why Trust Us",
  "seller_info": {
    "name": "Pro Seller",
    "rating": 4.75,
    "reviews_count": 570
  },
  "walmart_info": {
    "text": "Official Walmart Seller",
    "subtext": "Secure checkout and fast delivery"
  },
  "guarantee": {
    "text": "Free 90-Day Returns",
    "subtext": "Shop with confidence - easy returns"
  }
}'
) ON CONFLICT DO NOTHING;

-- 8. Product Gallery Table
CREATE TABLE IF NOT EXISTS product_gallery (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    content JSONB NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Insert default product gallery data
INSERT INTO product_gallery (content) VALUES (
'{
  "title": "See What'\''s Inside Your Box",
  "images": [
    {
      "url": "https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2F79d471e5bc56457eb2c3b1c3eb6586ae?format=webp&width=800",
      "title": "Complete Collection",
      "alt": "Nutritious Snack Box with Breakfast Bars and Delicious Chips - 42 Count"
    },
    {
      "url": "https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2F05b5599b733643de9ed02db80950feb9?format=webp&width=800",
      "title": "Inside View",
      "alt": "Inside view of snack box"
    },
    {
      "url": "https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2Fec2c685b6b9d438f97083ea2cdb4458b?format=webp&width=800",
      "title": "Beautiful Packaging",
      "alt": "Outside box view"
    }
  ]
}'
) ON CONFLICT DO NOTHING;

-- 9. Why Choose Section Table
CREATE TABLE IF NOT EXISTS why_choose_section (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    content JSONB NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Insert default why choose section data
INSERT INTO why_choose_section (content) VALUES (
'{
  "title": "Why Choose Our Nutritious Snack Box?",
  "benefits": [
    {
      "title": "Variety of Snacks",
      "description": "Perfect mix of breakfast bars and savory snacks for any time of day",
      "color": "blue",
      "image": "https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2F4d9abe9f679440fcb3470285697707f4?format=webp&width=800"
    },
    {
      "title": "High-End Packaging",
      "description": "Attractive and professional packaging that makes a great impression",
      "color": "purple",
      "image": "https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2F6305c43f8b6449fc8926c50b002e25fe?format=webp&width=800"
    },
    {
      "title": "Grab-and-Go Convenience",
      "description": "Individually packaged snacks perfect for busy lifestyles",
      "color": "green",
      "image": "https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2F26b950db7e9644baa7113c5a0046d0fa?format=webp&width=800"
    },
    {
      "title": "Suitable for All Ages",
      "description": "Perfect for adults, teens, and college students alike",
      "color": "orange",
      "image": "https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2Fa7c068e933744309b8f41ed0726156a2?format=webp&width=800"
    },
    {
      "title": "Heartwarming Greeting Card",
      "description": "Comes with a special greeting card to show you care",
      "color": "red",
      "image": "https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2F19d8d6717d2a4dc6b633c9494573527a?format=webp&width=800"
    },
    {
      "title": "42 Count Value",
      "description": "Generous quantity ensuring lasting satisfaction and value",
      "color": "indigo",
      "image": "https://cdn.builder.io/api/v1/image/assets%2F79b7dfd5cb0f4ca0b96e836c27c6ef40%2F74bff8b15ba640b1acf1428f6b9b71b9?format=webp&width=800"
    }
  ]
}'
) ON CONFLICT DO NOTHING;

-- 10. Offer Pricing Table
CREATE TABLE IF NOT EXISTS offer_pricing (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    content JSONB NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Insert default offer pricing data
INSERT INTO offer_pricing (content) VALUES (
'{
  "title": "Ready to Fuel Your Day?",
  "subtitle": "Get your 42-count nutritious snack box today!",
  "sale_price": 31.95,
  "benefits": [
    "42 premium snacks included",
    "Fresh & high-quality snacks from top brands",
    "Perfect for gifting or office sharing",
    "Fast & reliable delivery nationwide",
    "Greeting card included"
  ],
  "cta_text": "Get Your Snack Box Now",
  "trust_elements": [
    {
      "icon": "Shield",
      "text": "Secure Payment"
    },
    {
      "icon": "Truck",
      "text": "Fast Shipping"
    },
    {
      "icon": "BadgeCheck",
      "text": "Satisfaction Guaranteed"
    }
  ]
}'
) ON CONFLICT DO NOTHING;

-- 11. Email Subscriptions Table (for storing newsletter subscriptions)
CREATE TABLE IF NOT EXISTS email_subscriptions (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    subscribed_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    source VARCHAR(100) DEFAULT 'exit_intent_popup',
    active BOOLEAN DEFAULT true
);

-- Create updated_at triggers for all tables
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Apply updated_at triggers to all content tables
CREATE TRIGGER update_hero_section_updated_at BEFORE UPDATE ON hero_section FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_customer_reviews_updated_at BEFORE UPDATE ON customer_reviews FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_seo_settings_updated_at BEFORE UPDATE ON seo_settings FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_product_popup_updated_at BEFORE UPDATE ON product_popup FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_exit_intent_popup_updated_at BEFORE UPDATE ON exit_intent_popup FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_footer_updated_at BEFORE UPDATE ON footer FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_trust_section_updated_at BEFORE UPDATE ON trust_section FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_product_gallery_updated_at BEFORE UPDATE ON product_gallery FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_why_choose_section_updated_at BEFORE UPDATE ON why_choose_section FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_offer_pricing_updated_at BEFORE UPDATE ON offer_pricing FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Enable Row Level Security (RLS) for all tables
ALTER TABLE hero_section ENABLE ROW LEVEL SECURITY;
ALTER TABLE customer_reviews ENABLE ROW LEVEL SECURITY;
ALTER TABLE seo_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_popup ENABLE ROW LEVEL SECURITY;
ALTER TABLE exit_intent_popup ENABLE ROW LEVEL SECURITY;
ALTER TABLE footer ENABLE ROW LEVEL SECURITY;
ALTER TABLE trust_section ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_gallery ENABLE ROW LEVEL SECURITY;
ALTER TABLE why_choose_section ENABLE ROW LEVEL SECURITY;
ALTER TABLE offer_pricing ENABLE ROW LEVEL SECURITY;
ALTER TABLE email_subscriptions ENABLE ROW LEVEL SECURITY;

-- Create policies for public read access (everyone can read content)
CREATE POLICY "Allow public read access" ON hero_section FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON customer_reviews FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON seo_settings FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON product_popup FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON exit_intent_popup FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON footer FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON trust_section FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON product_gallery FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON why_choose_section FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON offer_pricing FOR SELECT USING (true);

-- Create policies for authenticated admin users to manage content
-- Note: You'll need to create admin users and assign them roles if needed
CREATE POLICY "Allow admin full access" ON hero_section FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow admin full access" ON customer_reviews FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow admin full access" ON seo_settings FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow admin full access" ON product_popup FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow admin full access" ON exit_intent_popup FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow admin full access" ON footer FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow admin full access" ON trust_section FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow admin full access" ON product_gallery FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow admin full access" ON why_choose_section FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow admin full access" ON offer_pricing FOR ALL USING (auth.role() = 'authenticated');

-- Email subscriptions: allow public insert, but only authenticated can read
CREATE POLICY "Allow public insert" ON email_subscriptions FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow admin read access" ON email_subscriptions FOR SELECT USING (auth.role() = 'authenticated');

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_hero_section_updated_at ON hero_section(updated_at);
CREATE INDEX IF NOT EXISTS idx_customer_reviews_updated_at ON customer_reviews(updated_at);
CREATE INDEX IF NOT EXISTS idx_seo_settings_updated_at ON seo_settings(updated_at);
CREATE INDEX IF NOT EXISTS idx_product_popup_updated_at ON product_popup(updated_at);
CREATE INDEX IF NOT EXISTS idx_exit_intent_popup_updated_at ON exit_intent_popup(updated_at);
CREATE INDEX IF NOT EXISTS idx_footer_updated_at ON footer(updated_at);
CREATE INDEX IF NOT EXISTS idx_trust_section_updated_at ON trust_section(updated_at);
CREATE INDEX IF NOT EXISTS idx_product_gallery_updated_at ON product_gallery(updated_at);
CREATE INDEX IF NOT EXISTS idx_why_choose_section_updated_at ON why_choose_section(updated_at);
CREATE INDEX IF NOT EXISTS idx_offer_pricing_updated_at ON offer_pricing(updated_at);
CREATE INDEX IF NOT EXISTS idx_email_subscriptions_email ON email_subscriptions(email);
CREATE INDEX IF NOT EXISTS idx_email_subscriptions_subscribed_at ON email_subscriptions(subscribed_at);

-- Create a view for easy content management (optional)
CREATE OR REPLACE VIEW content_overview AS
SELECT 
    'hero_section' as table_name,
    id,
    updated_at,
    content->>'title' as title
FROM hero_section
UNION ALL
SELECT 
    'customer_reviews' as table_name,
    id,
    updated_at,
    content->>'title' as title
FROM customer_reviews
UNION ALL
SELECT 
    'seo_settings' as table_name,
    id,
    updated_at,
    content->>'meta_title' as title
FROM seo_settings
UNION ALL
SELECT 
    'product_popup' as table_name,
    id,
    updated_at,
    content->>'title' as title
FROM product_popup
UNION ALL
SELECT 
    'exit_intent_popup' as table_name,
    id,
    updated_at,
    content->>'title' as title
FROM exit_intent_popup
UNION ALL
SELECT 
    'footer' as table_name,
    id,
    updated_at,
    'Footer Social Links' as title
FROM footer
UNION ALL
SELECT 
    'trust_section' as table_name,
    id,
    updated_at,
    content->>'title' as title
FROM trust_section
UNION ALL
SELECT 
    'product_gallery' as table_name,
    id,
    updated_at,
    content->>'title' as title
FROM product_gallery
UNION ALL
SELECT 
    'why_choose_section' as table_name,
    id,
    updated_at,
    content->>'title' as title
FROM why_choose_section
UNION ALL
SELECT 
    'offer_pricing' as table_name,
    id,
    updated_at,
    content->>'title' as title
FROM offer_pricing
ORDER BY updated_at DESC;
