module GenUtils
    def self.cap_name(name)
        name_parts = name.split(/\s+/)
        cap_name_parts = []
        for np in name_parts do
            cap_name_parts.push(np.capitalize)
        end
        cap_name_parts.join(" ")
    end
end
