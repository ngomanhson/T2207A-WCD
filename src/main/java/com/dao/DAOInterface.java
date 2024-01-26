package com.dao;

import java.util.List;

public interface DAOInterface<S> {
    List<S> get();
    boolean create(S s);
    boolean update(S s);
    boolean delete(S s);
    <K> S find(K id);
}
