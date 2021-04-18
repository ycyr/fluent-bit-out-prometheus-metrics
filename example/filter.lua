function cb_get_message_byte_count(tag, timestamp, record)
    new_record = record
    v = string.len(record["message"])
    new_record["message_byte_count"] = v
    code = 2
    return code, timestamp, new_record
end