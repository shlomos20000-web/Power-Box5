-- Supabase Database Schema for Dynamic Content Management
-- This script creates all necessary tables for the frontend to pull dynamic content

-- Enable necessary extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. SEO Settings Table
CREATE TABLE IF NOT EXISTS seo_settings (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Hero Section Table
CREATE TABLE IF NOT EXISTS hero_section (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. Why Choose Section Table
CREATE TABLE IF NOT EXISTS why_choose_section (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 4. Product Gallery Table
CREATE TABLE IF NOT EXISTS product_gallery (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 5. Trust Section Table
CREATE TABLE IF NOT EXISTS trust_section (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 6. Customer Reviews Table
CREATE TABLE IF NOT EXISTS customer_reviews (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 7. Offer Pricing Table
CREATE TABLE IF NOT EXISTS offer_pricing (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 8. Footer Table
CREATE TABLE IF NOT EXISTS footer (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 9. Product Popup Table
CREATE TABLE IF NOT EXISTS product_popup (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 10. Exit Intent Popup Table
CREATE TABLE IF NOT EXISTS exit_intent_popup (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 11. Email Subscriptions Table (for tracking)
CREATE TABLE IF NOT EXISTS email_subscriptions (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    email TEXT NOT NULL,
    subscribed_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    source TEXT DEFAULT 'unknown',
    active BOOLEAN DEFAULT TRUE
);

-- Create functions to update timestamps
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Add update triggers for all content tables
CREATE TRIGGER update_seo_settings_updated_at BEFORE UPDATE ON seo_settings FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_hero_section_updated_at BEFORE UPDATE ON hero_section FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_why_choose_section_updated_at BEFORE UPDATE ON why_choose_section FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_product_gallery_updated_at BEFORE UPDATE ON product_gallery FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_trust_section_updated_at BEFORE UPDATE ON trust_section FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_customer_reviews_updated_at BEFORE UPDATE ON customer_reviews FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_offer_pricing_updated_at BEFORE UPDATE ON offer_pricing FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_footer_updated_at BEFORE UPDATE ON footer FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_product_popup_updated_at BEFORE UPDATE ON product_popup FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_exit_intent_popup_updated_at BEFORE UPDATE ON exit_intent_popup FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Insert default data for all tables

-- 1. SEO Settings Default Data
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
    }'::jsonb
) ON CONFLICT DO NOTHING;

-- 2. Hero Section Default Data
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
    }'::jsonb
) ON CONFLICT DO NOTHING;

-- 3. Customer Reviews Default Data
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
            }
        ]
    }'::jsonb
) ON CONFLICT DO NOTHING;

-- 4. Footer Default Data
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
    }'::jsonb
) ON CONFLICT DO NOTHING;

-- 5. Product Popup Default Data
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
        "popup_image": "https://cdn.builder.io/api/v1/image/assets%2F84282e2d620247d2b8d8845fda2c790e%2F79d471e5bc56457eb2c3b1c3eb6586ae?format=webp&width=800"
    }'::jsonb
) ON CONFLICT DO NOTHING;

-- 6. Exit Intent Popup Default Data  
INSERT INTO exit_intent_popup (content) VALUES (
    '{
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
    }'::jsonb
) ON CONFLICT DO NOTHING;

-- Add indexes for better performance
CREATE INDEX IF NOT EXISTS idx_seo_settings_updated_at ON seo_settings(updated_at);
CREATE INDEX IF NOT EXISTS idx_hero_section_updated_at ON hero_section(updated_at);
CREATE INDEX IF NOT EXISTS idx_customer_reviews_updated_at ON customer_reviews(updated_at);
CREATE INDEX IF NOT EXISTS idx_footer_updated_at ON footer(updated_at);
CREATE INDEX IF NOT EXISTS idx_product_popup_updated_at ON product_popup(updated_at);
CREATE INDEX IF NOT EXISTS idx_exit_intent_popup_updated_at ON exit_intent_popup(updated_at);
CREATE INDEX IF NOT EXISTS idx_email_subscriptions_email ON email_subscriptions(email);
CREATE INDEX IF NOT EXISTS idx_email_subscriptions_active ON email_subscriptions(active);

-- Enable RLS (Row Level Security) for better security
ALTER TABLE seo_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE hero_section ENABLE ROW LEVEL SECURITY;
ALTER TABLE why_choose_section ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_gallery ENABLE ROW LEVEL SECURITY;
ALTER TABLE trust_section ENABLE ROW LEVEL SECURITY;
ALTER TABLE customer_reviews ENABLE ROW LEVEL SECURITY;
ALTER TABLE offer_pricing ENABLE ROW LEVEL SECURITY;
ALTER TABLE footer ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_popup ENABLE ROW LEVEL SECURITY;
ALTER TABLE exit_intent_popup ENABLE ROW LEVEL SECURITY;
ALTER TABLE email_subscriptions ENABLE ROW LEVEL SECURITY;

-- Create policies for public read access (content tables)
CREATE POLICY "Allow public read access" ON seo_settings FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON hero_section FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON why_choose_section FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON product_gallery FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON trust_section FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON customer_reviews FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON offer_pricing FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON footer FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON product_popup FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON exit_intent_popup FOR SELECT USING (true);

-- Email subscriptions: Allow insert for new subscriptions
CREATE POLICY "Allow public insert" ON email_subscriptions FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public read own" ON email_subscriptions FOR SELECT USING (true);

COMMENT ON TABLE seo_settings IS 'Stores SEO metadata that can be updated from admin dashboard';
COMMENT ON TABLE hero_section IS 'Stores hero section content including title, pricing, CTAs';
COMMENT ON TABLE customer_reviews IS 'Stores customer review content displayed on the site';
COMMENT ON TABLE footer IS 'Stores footer social links and other footer content';
COMMENT ON TABLE product_popup IS 'Stores product popup content and details';
COMMENT ON TABLE exit_intent_popup IS 'Stores exit intent popup content and email settings';
COMMENT ON TABLE email_subscriptions IS 'Stores email subscriptions from users';
