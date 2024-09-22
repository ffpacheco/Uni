def remove_leading(ip):
    ipparts= ip.split(".")
    ipfinal=''
    for parts in ipparts:
        intf=int(parts)
        ipfinal +=f"{intf}."
        ipfinal2= ipfinal.rstrip(".")
    return ipfinal2