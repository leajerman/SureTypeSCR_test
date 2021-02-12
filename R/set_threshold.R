set_threshold <- function(.data,clfcol,threshold)
{
  .data %>%
    mutate(gtype= case_when(eval(parse(text = clfcol))>threshold~ gtype,
                            TRUE ~ 'NC'))
}