files <- dir('belyx', full.names = T) %>% map_df(., ~ data_frame(file = .x, content = read_file(.x)))

corpus <- files %>% 
  mutate(content = str_replace_all(content, '(#|<.+>)', '')) %>% 
  unnest_tokens(input = content, output = 'sentence', token = 'sentences', to_lower = F) %>%
  mutate(sentence_id = 1:n()) %>%
  mutate(token_markup = stringr::str_replace_all(sentence, '(\\.|\\?|\\!|»|,|:)( |$)', '#\\1\\2')) %>% # adding dummy marking for post-token punct
  mutate(token_markup = stringr::str_replace_all(token_markup, '(«)', '\\1#')) %>% # and pre-token punct
  unnest_tokens(output = 'token', input = 'token_markup', token = 'regex', pattern = '(#| )', to_lower = F) %>% # word tokenization
  group_by(sentence_id) %>%
  mutate(token_id = paste0(str_extract(file, 'belyx-\\d\\d\\d'), '.', str_pad(1:n(), width = 3, pad = '0'))) %>%
  ungroup %>%
  arrange(sentence_id, token_id)

library(conllr)

corpus %>% mutate(lemma = '_') %>%
  mutate(pos = '_') %>%
  split(.$sentence_id) %>% 
  walk(., ~ write_conll(data = .x, 
                        sentence_id = .x$sentence_id[1], 
                        utterance = .x$sentence[1], 
                        ID = 'token_id', 
                        FORM = 'token',
                        path = 'belyx.conllu'))
