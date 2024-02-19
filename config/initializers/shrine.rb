require "cloudinary"
require "shrine/storage/cloudinary"
Cloudinary.config(
cloud_name: "dc2vrqece",
api_key: "913524789211834",
api_secret: "swl-1SXIblzUNOu84g_Nv-sW01w",
)
Shrine.storages = {
cache: Shrine::Storage::Cloudinary.new(prefix: "cache"), # for direct uploads
store: Shrine::Storage::Cloudinary.new(prefix: "rails_uploads"),
}
Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
Shrine.plugin :validation_helpers
Shrine.plugin :validation