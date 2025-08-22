-- Quick Fix for Database Errors
-- Run this script in your Supabase SQL Editor to fix all the errors

-- 1. Create offer_pricing table
CREATE TABLE IF NOT EXISTS offer_pricing (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL DEFAULT '{
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
            {"icon": "Shield", "text": "Secure Payment"},
            {"icon": "Truck", "text": "Fast Shipping"},
            {"icon": "BadgeCheck", "text": "Satisfaction Guaranteed"}
        ]
    }'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Create customer_reviews table
CREATE TABLE IF NOT EXISTS customer_reviews (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL DEFAULT '{
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
    }'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. Create footer table
CREATE TABLE IF NOT EXISTS footer (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL DEFAULT '{
        "social_links": [
            {"name": "Facebook", "url": "https://facebook.com", "icon": "Facebook"},
            {"name": "Instagram", "url": "https://instagram.com", "icon": "Instagram"},
            {"name": "Twitter", "url": "https://twitter.com", "icon": "Twitter"},
            {"name": "YouTube", "url": "https://youtube.com", "icon": "Youtube"},
            {"name": "TikTok", "url": "https://tiktok.com", "icon": "TikTok"}
        ]
    }'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 4. Create product_gallery table
CREATE TABLE IF NOT EXISTS product_gallery (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL DEFAULT '{
        "title": "See What'"'"'s Inside Your Box",
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
    }'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 5. Create trust_section table
CREATE TABLE IF NOT EXISTS trust_section (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    content JSONB NOT NULL DEFAULT '{
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
    }'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security (required for Supabase)
ALTER TABLE offer_pricing ENABLE ROW LEVEL SECURITY;
ALTER TABLE customer_reviews ENABLE ROW LEVEL SECURITY;
ALTER TABLE footer ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_gallery ENABLE ROW LEVEL SECURITY;
ALTER TABLE trust_section ENABLE ROW LEVEL SECURITY;

-- Create policies to allow public read access
CREATE POLICY "Enable read access for all users" ON offer_pricing FOR SELECT USING (true);
CREATE POLICY "Enable read access for all users" ON customer_reviews FOR SELECT USING (true);
CREATE POLICY "Enable read access for all users" ON footer FOR SELECT USING (true);
CREATE POLICY "Enable read access for all users" ON product_gallery FOR SELECT USING (true);
CREATE POLICY "Enable read access for all users" ON trust_section FOR SELECT USING (true);

-- Insert the default data (one row per table)
INSERT INTO offer_pricing (content) VALUES (DEFAULT) ON CONFLICT DO NOTHING;
INSERT INTO customer_reviews (content) VALUES (DEFAULT) ON CONFLICT DO NOTHING;
INSERT INTO footer (content) VALUES (DEFAULT) ON CONFLICT DO NOTHING;
INSERT INTO product_gallery (content) VALUES (DEFAULT) ON CONFLICT DO NOTHING;
INSERT INTO trust_section (content) VALUES (DEFAULT) ON CONFLICT DO NOTHING;

-- Success message
SELECT 'All tables created successfully! Your website errors should now be fixed.' AS status;
