package kr.co.uclick.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QMember is a Querydsl query type for Member
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QMember extends EntityPathBase<Member> {

    private static final long serialVersionUID = 1645104997L;

    public static final QMember member = new QMember("member1");

    public final StringPath age = createString("age");

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath name = createString("name");

    public final ListPath<Phone, QPhone> phones = this.<Phone, QPhone>createList("phones", Phone.class, QPhone.class, PathInits.DIRECT2);

    public final DateTimePath<java.util.Date> regdate = createDateTime("regdate", java.util.Date.class);

    public QMember(String variable) {
        super(Member.class, forVariable(variable));
    }

    public QMember(Path<? extends Member> path) {
        super(path.getType(), path.getMetadata());
    }

    public QMember(PathMetadata metadata) {
        super(Member.class, metadata);
    }

}

