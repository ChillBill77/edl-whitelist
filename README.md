# Project edl-whitelist

EDL (External Dynamic List) blacklisting, while effective for blocking known malicious domains, IPs, or URLs, is no longer sufficient in today’s rapidly evolving threat landscape. Cybercriminals constantly generate new, evasive threats that bypass blacklists faster than they can be updated. Thats why I am starting an initiative to create a whitelisting approach focuses on allowing only explicitly approved and vetted entities, creating a more proactive and controlled security model. This will help diffirentiate policies and features on trusted domains versus untrusted domains. This does not imply no more AV on O365 but skip DNS checks on certain IPs and allow a broader range of ports for optimized communications.

## Example Firewall Configurations

Refresh time is low as the lista are only updated 
### Fortigate 
```
config system external-resource
    edit "GAFAM_GoogleIPv4_example"
        set status enable
        set type address
        set resource "<URL of List>"
        set server-identity-check none
        set refresh-rate 43200
    next
end

```
### Palo Alto Firewalls
```
set external-list "GAFAM - Google IPv4 example" type ip recurring daily at 20
set external-list "GAFAM - Google IPv4 example" type ip url <URL of List>
```


