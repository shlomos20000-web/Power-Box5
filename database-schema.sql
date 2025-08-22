-- Database Schema for Dynamic Content Management
-- Run this SQL in your Supabase SQL Editor

-- SEO Settings Table
CREATE TABLE IF NOT EXISTS seo_settings (
  id SERIAL PRIMARY KEY,
  content JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Hero Section Table
CREATE TABLE IF NOT EXISTS hero_section (
  id SERIAL PRIMARY KEY,
  content JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Why Choose Section Table
CREATE TABLE IF NOT EXISTS why_choose_section (
  id SERIAL PRIMARY KEY,
  content JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Product Popup Table (already referenced in hooks)
CREATE TABLE IF NOT EXISTS product_popup (
  id SERIAL PRIMARY KEY,
  content JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Exit Intent Popup Table (already referenced in hooks)
CREATE TABLE IF NOT EXISTS exit_intent_popup (
  id SERIAL PRIMARY KEY,
  content JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Customer Reviews Table
CREATE TABLE IF NOT EXISTS customer_reviews (
  id SERIAL PRIMARY KEY,
  content JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Offer Pricing Table
CREATE TABLE IF NOT EXISTS offer_pricing (
  id SERIAL PRIMARY KEY,
  content JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Footer Table
CREATE TABLE IF NOT EXISTS footer (
  id SERIAL PRIMARY KEY,
  content JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Email Subscriptions Table (already referenced in hooks)
CREATE TABLE IF NOT EXISTS email_subscriptions (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  subscribed_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  source VARCHAR(100),
  active BOOLEAN DEFAULT TRUE
);

-- Product Gallery Table
CREATE TABLE IF NOT EXISTS product_gallery (
  id SERIAL PRIMARY KEY,
  content JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Trust Section Table  
CREATE TABLE IF NOT EXISTS trust_section (
  id SERIAL PRIMARY KEY,
  content JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_seo_settings_updated_at ON seo_settings(updated_at);
CREATE INDEX IF NOT EXISTS idx_hero_section_updated_at ON hero_section(updated_at);
CREATE INDEX IF NOT EXISTS idx_email_subscriptions_email ON email_subscriptions(email);
CREATE INDEX IF NOT EXISTS idx_email_subscriptions_active ON email_subscriptions(active);

-- Insert default data for SEO settings
INSERT INTO seo_settings (content) 
VALUES ('{
  "meta_title": "Nutritious Snack Box with Breakfast Bars and Delicious Chips | Gift A Snack (42 Count)",
  "meta_description": "Get your 42-count nutritious snack box with breakfast bars and delicious chips. Perfect for gifting, office sharing, or personal enjoyment. Fast delivery, high-quality snacks.",
  "meta_keywords": "snack box, breakfast bars, healthy snacks, gift box, nutritious snacks, office snacks, 42 count, delicious chips",
  "og_title": "Nutritious Snack Box - 42 Premium Snacks | Gift A Snack",
  "og_description": "Amazing variety of snacks! Perfect for office teams, college students, and gifts. Fresh & high-quality snacks with fast delivery.",
  "og_image": "https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2F79d471e5bc56457eb2c3b1c3eb6586ae?format=webp&width=1200",
  "canonical_url": "",
  "facebook_pixel_id": ""
}'::jsonb)
ON CONFLICT DO NOTHING;

-- Insert default data for hero section
INSERT INTO hero_section (content)
VALUES ('{
  "title": "Nutritious Snack Box with Breakfast Bars and Delicious Chips | Gift A Snack (42 Count)",
  "rating": 4.6,
  "reviews_count": 23,
  "sale_price": 31.95,
  "features": [
    "Fresh & high-quality snacks",
    "Walmart+ offer eligible"
  ],
  "delivery_text": "Fast & reliable delivery",
  "urgency_text": "Limited stock available",
  "primary_cta": "View Product Details",
  "secondary_cta": "Learn More About This Product",
  "main_image": "https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2F79d471e5bc56457eb2c3b1c3eb6586ae?format=webp&width=800",
  "walmart_url": "https://www.walmart.com/ip/Healthy-Snack-Box-Tasty-Nutrient-Rich-Variety-42-Count-by-Gift-A-Snack/14479818419?selectedSellerId=16964&selectedOfferId=BEA9DA42A8853A4C927EECB4D702F303&clickid=3PE2sMyDBxycW1s0QQThKWW7Ukp2AmR-AQ%3AGxo0&irgwc=1&sourceid=imp_3PE2sMyDBxycW1s0QQThKWW7Ukp2AmR-AQ%3AGxo0&veh=aff&wmlspartner=imp_5610446&affiliates_ad_id=565706&campaign_id=9383&sharedid=mp_16964_2016489964_knpf1_4mtlu49_BEA9DA42A8853A4C927EECB4D702F303&utm_source=landing&utm_medium=cta&utm_campaign=snackbox"
}'::jsonb)
ON CONFLICT DO NOTHING;

-- Insert default data for why choose section
INSERT INTO why_choose_section (content)
VALUES ('{
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
}'::jsonb)
ON CONFLICT DO NOTHING;

-- Insert default data for product gallery
INSERT INTO product_gallery (content)
VALUES ('{
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
}'::jsonb)
ON CONFLICT DO NOTHING;

-- Insert default data for trust section
INSERT INTO trust_section (content)
VALUES ('{
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
}'::jsonb)
ON CONFLICT DO NOTHING;

-- Insert default data for customer reviews
INSERT INTO customer_reviews (content)
VALUES ('{
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
    }
  ]
}'::jsonb)
ON CONFLICT DO NOTHING;

-- Insert default data for offer pricing
INSERT INTO offer_pricing (content)
VALUES ('{
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
}'::jsonb)
ON CONFLICT DO NOTHING;

-- Insert default data for footer
INSERT INTO footer (content)
VALUES ('{
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
}'::jsonb)
ON CONFLICT DO NOTHING;

-- Insert default data for product popup
INSERT INTO product_popup (content)
VALUES ('{
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
  "popup_image": "https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2F79d471e5bc56457eb2c3b1c3eb6586ae?format=webp&width=800"
}'::jsonb)
ON CONFLICT DO NOTHING;

-- Insert default data for exit intent popup
INSERT INTO exit_intent_popup (content)
VALUES ('{
  "title": "Stay Updated",
  "description": "👉 Subscribe now to be the first to know about our upcoming exclusive offers\n\n👉 Join our mailing list and get the latest news and special deals before anyone else.",
  "email_placeholder": "👉 Enter your email here",
  "subscribe_button_text": "👉 Subscribe Now",
  "dismiss_button_text": "👉 Maybe later",
  "privacy_note": "👉 🔒 We will never send you spam. You can unsubscribe anytime",
  "destination_email": "",
  "mailchimp_api_key": "",
  "mailchimp_list_id": "",
  "brevo_api_key": "",
  "brevo_list_id": ""
}'::jsonb)
ON CONFLICT DO NOTHING;

-- Enable Row Level Security (RLS) and set up policies for secure access
ALTER TABLE seo_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE hero_section ENABLE ROW LEVEL SECURITY;
ALTER TABLE why_choose_section ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_popup ENABLE ROW LEVEL SECURITY;
ALTER TABLE exit_intent_popup ENABLE ROW LEVEL SECURITY;
ALTER TABLE customer_reviews ENABLE ROW LEVEL SECURITY;
ALTER TABLE offer_pricing ENABLE ROW LEVEL SECURITY;
ALTER TABLE footer ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_gallery ENABLE ROW LEVEL SECURITY;
ALTER TABLE trust_section ENABLE ROW LEVEL SECURITY;
ALTER TABLE email_subscriptions ENABLE ROW LEVEL SECURITY;

-- Create policies for public read access and authenticated write access
-- (Adjust these policies based on your authentication needs)

-- Public read access for all content tables
CREATE POLICY "Allow public read access" ON seo_settings FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON hero_section FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON why_choose_section FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON product_popup FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON exit_intent_popup FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON customer_reviews FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON offer_pricing FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON footer FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON product_gallery FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON trust_section FOR SELECT USING (true);

-- Public insert access for email subscriptions
CREATE POLICY "Allow public email subscription" ON email_subscriptions FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public read own email" ON email_subscriptions FOR SELECT USING (true);

-- Note: For admin access to update content, you'll need to set up authentication
-- and create appropriate policies for authenticated users with admin roles
