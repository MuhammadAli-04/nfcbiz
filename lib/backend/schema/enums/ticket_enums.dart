enum TicketFilter { all, private, public }

TicketFilter getTicketFilter(String filter) {
  switch (filter) {
    case "All":
      return TicketFilter.all;
    case "Private":
      return TicketFilter.private;
    case "Public":
      return TicketFilter.public;
    default:
      return TicketFilter.all;
  }
}
